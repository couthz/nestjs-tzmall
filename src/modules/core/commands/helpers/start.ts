/* eslint-disable import/no-extraneous-dependencies */

import { join } from 'path';

import { exit } from 'process';

import { PluginMetadataGenerator } from '@nestjs/cli/lib/compiler/plugins';
import { ReadonlyVisitor } from '@nestjs/swagger/dist/plugin';
import { PluginOptions } from '@nestjs/swagger/dist/plugin/merge-options';
import { Subprocess } from 'bun';
import { get, isNil, pick } from 'lodash';
import pm2 from 'pm2';
import { Arguments } from 'yargs';

import { Configure } from '@/modules/config/configure';

import { AppConfig } from '../../types';
import { CLIConfig, StartCommandArguments } from '../types';

import { Asset } from './asset';
import { getPm2Config } from './utils';

/**
 * 正常启动应用
 * 如果直接运行TS源码或者设置了优先使用bun启动,则使用bun启动应用
 * 否则使用node fork一个子进程启动main.js
 * @param args
 * @param script
 */
export const start = async (args: Arguments<StartCommandArguments>, config: CLIConfig) => {
    const codePath = args.typescript ? config.paths.src : config.paths.dist;
    const script = args.typescript ? config.paths.ts : config.paths.js;
    const params = [config.paths.bun, 'run'];
    if (args.watch) params.push('--watch');
    if (args.debug) {
        const inspectFlag =
            typeof args.debug === 'string' ? `--inspect=${args.debug}` : '--inspect';
        params.push(inspectFlag);
    }
    params.push(script);
    let child: Subprocess;
    if (args.watch) {
        if (args.typescript) generateSwaggerMetadata(args, config, true);
        const asseter = new Asset();
        const restart = () => {
            if (!isNil(child)) child.kill();
            child = Bun.spawn(params, config.subprocess.bun);
        };
        restart();
        asseter.watchAssets(config, codePath, restart);
        process.on('exit', () => {
            child.kill();
            asseter.closeWatchers();
            process.exit(0);
        });
    } else {
        if (args.typescript) generateSwaggerMetadata(args, config, false);
        Bun.spawn(params, {
            ...config.subprocess.bun,
            onExit(proc) {
                proc.kill();
                process.exit(0);
            },
        });
    }
};

/**
 * 生产环境下使用PM2静默启动应用
 * @param configure
 * @param args
 * @param script
 */
export const startProd = async (
    configure: Configure,
    args: Arguments<StartCommandArguments>,
    config: CLIConfig,
) => {
    const { name } = await configure.get<AppConfig>('app');
    const script = args.typescript ? config.paths.ts : config.paths.js;
    const pm2Config = await getPm2Config(
        configure,
        {
            command: 'start',
            ...pick(args, ['watch', 'typescript']),
        },
        config,
        script,
    );
    const connectCallback = (error?: any) => {
        if (!isNil(error)) {
            console.error(error);
            process.exit(2);
        }
    };
    const startCallback = (error?: any) => {
        if (!isNil(error)) {
            console.error(error);
            exit(1);
        }
        pm2.disconnect();
    };
    const restartCallback = (error?: any) => {
        if (!isNil(error)) {
            pm2.start(pm2Config, (serr) => startCallback(serr));
        } else {
            pm2.disconnect();
        }
    };

    pm2.connect((cerr) => {
        connectCallback(cerr);
        generateSwaggerMetadata(args, config, false);
        args.restart
            ? pm2.restart(name, restartCallback)
            : pm2.start(pm2Config, (serr) => startCallback(serr));
    });
};

export const generateSwaggerMetadata = (
    args: Arguments<StartCommandArguments>,
    config: CLIConfig,
    watch: boolean,
) => {
    const cliPlugins = get(config.options.nest, 'compilerOptions.plugins', []) as (
        | string
        | RecordAny
    )[];
    const swaggerPlugin = cliPlugins.find(
        (item) => item === '@nestjs/swagger' || (item as any).name === '@nestjs/swagger',
    );
    if (!isNil(swaggerPlugin)) {
        const srcPath = join(config.paths.cwd, config.paths.src);
        const generator = new PluginMetadataGenerator();
        let swaggerPluginOption: PluginOptions = {};
        if (typeof swaggerPlugin !== 'string' && 'options' in swaggerPlugin) {
            swaggerPluginOption = swaggerPlugin.options;
        }
        generator.generate({
            visitors: [new ReadonlyVisitor({ ...swaggerPluginOption, pathToSource: srcPath })],
            outputDir: srcPath,
            watch,
            tsconfigPath: args.tsConfig,
            printDiagnostics: false,
        });
    }
};

// /**
//  * 非生产环境(开发环境等)下使用nest cli启动应用
//  * 逻辑如下:
//  * 如果设置了优先使用bun启动则使用bun运行nest cli
//  * 如果不是则使用node fork一个子进程运行nest cli
//  * @param args
//  * @param script
//  */
// export const startDev = async (args: yargs.Arguments<StartCommandArguments>) => {
//     const params: string[] = ['start'];
//     if (args.watch) params.push('-w');
//     if (args.debug) params.push('-d');
//     const child = spawn(scripts.nest, params, subpOption.node);
//     child.on('exit', () => exit());
// };
