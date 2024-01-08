import { exit } from 'process';

import chalk from 'chalk';
import { isNil, pick } from 'lodash';
import pm2 from 'pm2';

import { Arguments } from 'yargs';

import { Configure } from '@/modules/config/configure';

import { AppConfig } from '../types';

import { getPm2Config } from './helpers/config';
import { CLIConfig, PM2Arguments } from './types';

/**
 * 生产环境下使用PM2静默启动应用
 * @param configure
 * @param args
 * @param script
 */
export const pm2Handler = async (
    configure: Configure,
    args: Arguments<PM2Arguments>,
    config: CLIConfig,
) => {
    const { name } = await configure.get<AppConfig>('app');
    const script = args.typescript ? config.paths.ts : config.paths.js;
    const pm2Config = await getPm2Config(
        configure,
        {
            command: 'start',
            watch: args.watch,
            ...pick(args, ['watch']),
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
        args.restart
            ? pm2.restart(name, restartCallback)
            : pm2.start(pm2Config, (serr) => startCallback(serr));
    });
};
