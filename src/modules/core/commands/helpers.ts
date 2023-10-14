import { ForkOptions } from 'child_process';
import { resolve } from 'path';

import { exit } from 'process';

import type { SpawnOptions } from 'bun';

import { omit } from 'lodash';
import { StartOptions } from 'pm2';

import { Configure } from '@/modules/config/configure';

import { deepMerge } from '../helpers';
import { AppConfig } from '../types';

import { Pm2ConfigParams } from './types';

export const cwdPath = resolve(__dirname, '../../../..');
export const scripts = {
    ts: './src/main.ts',
    js: './dist/main.js',
    bun: './node_modules/bun/bin/bun',
    nest: './node_modules/@nestjs/cli/bin/nest.js',
};
export const subpOption: { bun: SpawnOptions.OptionsObject; fork: ForkOptions } = {
    bun: {
        cwd: cwdPath,
        stdout: 'inherit',
        onExit(proc) {
            proc.kill();
            exit();
        },
    },
    fork: {
        cwd: cwdPath,
        stdio: 'inherit',
    },
};

/**
 * 获取pm2选项配置
 * 如果是直接运行ts源码或者设置了优先使用bun,则使用bun作为启动器
 * @param configure
 * @param args
 * @param script
 */
export const getPm2Config = async (
    configure: Configure,
    option: Pm2ConfigParams,
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
    };
    if (option.typescript || option.bun) defaultConfig.interpreter = scripts.bun;
    return deepMerge(
        defaultConfig,
        omit(customConfig, ['name', 'cwd', 'script', 'args', 'watch', 'interpreter']),
        'replace',
    );
};
