/* eslint-disable import/no-extraneous-dependencies */
import { existsSync, readFileSync } from 'fs';
import { join, resolve } from 'path';

import { exit } from 'process';

import { Configuration as NestCLIConfig } from '@nestjs/cli/lib/configuration';
import { get, isNil, omit } from 'lodash';
import { StartOptions } from 'pm2';
import ts from 'typescript';

import { Configure } from '@/common/config/configure';

import { deepMerge, panic } from '../../helpers';
import { AppConfig } from '../../types';
import { CLIConfig, Pm2Option } from '../types';
/**
 * 执行路径(应用根目录)
 */
const cwdPath = resolve(__dirname, '../../../../..');

/**
 * 获取CLI的运行配置
 * @param tsConfigFile
 * @param nestConfigFile
 * @param tsEntryFile
 */
export const getCLIConfig = (
    tsConfigFile: string,
    nestConfigFile: string,
    tsEntryFile?: string,
): CLIConfig => {
    let tsConfig: ts.CompilerOptions = {};
    const tsConfigPath = join(cwdPath, tsConfigFile);

    if (!existsSync(tsConfigPath)) panic(`ts config file '${tsConfigPath}' not exists!`);
    try {
        const allTsConfig = JSON.parse(readFileSync(tsConfigPath, 'utf-8'));
        tsConfig = get(allTsConfig, 'compilerOptions', {});
    } catch (error) {
        panic({ error });
    }
    let nestConfig: NestCLIConfig = {};
    const nestConfigPath = join(cwdPath, nestConfigFile);
    if (!existsSync(nestConfigPath)) panic(`nest cli config file '${nestConfigPath}' not exists!`);
    try {
        nestConfig = JSON.parse(readFileSync(nestConfigPath, 'utf-8'));
    } catch (error) {
        panic({ error });
    }
    const dist = get(tsConfig, 'outDir', 'dist');
    const src = get(nestConfig, 'sourceRoot', 'src');
    const paths = {
        cwd: cwdPath,
        dist,
        src,
        js: join(dist, nestConfig.entryFile ?? 'main.js'),
        ts: join(src, tsEntryFile ?? 'main.ts'),
        bun: './node_modules/bun/bin/bun',
        nest: './node_modules/@nestjs/cli/bin/nest.js',
    };

    return {
        options: {
            ts: tsConfig,
            nest: nestConfig,
        },
        paths,
        subprocess: {
            bun: {
                cwd: cwdPath,
                stdout: 'inherit',
                env: process.env,
                onExit: (proc) => {
                    proc.kill();
                    if (!isNil(proc.exitCode)) exit(0);
                },
            },
            node: {
                cwd: cwdPath,
                env: process.env,
                stdio: 'inherit',
            },
        },
    };
};

export const getPm2Config = async (
    configure: Configure,
    option: Pm2Option,
    config: CLIConfig,
    script: string,
): Promise<StartOptions> => {
    const { name, pm2: customConfig = {} } = await configure.get<AppConfig>('app');
    const defaultConfig: StartOptions = {
        name,
        cwd: cwdPath,
        script,
        args: option.command,
        autorestart: true,
        watch: option.watch,
        ignore_watch: ['node_modules'],
        env: process.env,
        exec_mode: 'fork',
        interpreter: config.paths.bun,
    };
    return deepMerge(
        defaultConfig,
        omit(customConfig, ['name', 'cwd', 'script', 'args', 'watch', 'interpreter']),
        'replace',
    );
};
