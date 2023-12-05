import { exit } from 'process';

import { Subprocess } from 'bun';
import chalk from 'chalk';
import { isNil, pick } from 'lodash';
import pm2 from 'pm2';

import { Arguments } from 'yargs';

import { Configure } from '@/common/config/configure';

import { AppConfig } from '../../types';
import { CLIConfig, StartCommandArguments } from '../types';

import { Asset } from './asset';
import { getPm2Config } from './config';
import { generateSwaggerMetadata } from './swagger';

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
        if (args.typescript) generateSwaggerMetadata(args, config, false);
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
export const startPM2 = async (
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
    if (pm2Config.exec_mode === 'cluster' && args.typescript) {
        console.log(
            chalk.yellowBright(
                'Cannot directly use bun to run ts code in cluster mode, so it will automatically change to fork mode.',
            ),
        );
        console.log();
        console.log(
            chalk.bgCyanBright(
                chalk.blackBright(
                    'If you really need the app to be started in cluster mode, be sure to compile it into js first, and then add the --no-ts arg when running',
                ),
            ),
        );
        console.log();
        pm2Config.exec_mode = 'fork';
    }
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
