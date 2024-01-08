import { existsSync } from 'fs';
import { join, resolve } from 'path';
import { exit } from 'process';

import chalk from 'chalk';
import { isNil, pick, omit } from 'lodash';
import pm2, { StartOptions } from 'pm2';

import { Arguments } from 'yargs';

import { Configure } from '@/modules/config/configure';

import { deepMerge, panic } from '../helpers';
import { AppConfig } from '../types';

import { Pm2Arguments, Pm2Option } from './types';

/**
 * 执行路径(应用根目录)
 */
const cwdPath = resolve(__dirname, '../../../..');

/**
 * 生产环境下使用PM2静默启动应用
 * @param configure
 * @param args
 * @param script
 */
export const pm2Handler = async (configure: Configure, args: Arguments<Pm2Arguments>) => {
    const { name } = await configure.get<AppConfig>('app');
    const pm2Config = await getPm2Config(configure, pick(args, ['args', 'watch']), args.entry);
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
        args.restart
            ? pm2.restart(name, restartCallback)
            : pm2.start(pm2Config, (serr) => startCallback(serr));
    });
};

export const getPm2Config = async (
    configure: Configure,
    option: Pm2Option,
    script: string,
): Promise<StartOptions> => {
    if (!existsSync(join(cwdPath, script)))
        panic(chalk.red(`entry script file '${join(cwdPath, script)}' not exists!`));
    const { name, pm2: customConfig = {} } = await configure.get<AppConfig>('app');
    const defaultConfig: StartOptions = {
        name,
        cwd: cwdPath,
        script,
        args: option.args,
        autorestart: true,
        watch: option.watch,
        ignore_watch: ['node_modules'],
        env: process.env,
        exec_mode: 'fork',
    };
    return deepMerge(
        defaultConfig,
        omit(customConfig, ['name', 'cwd', 'script', 'args', 'watch', 'interpreter']),
        'replace',
    );
};
