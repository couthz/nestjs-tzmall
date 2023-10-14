import { fork } from 'child_process';

import { exit } from 'process';

import { pick } from 'lodash';

import pm2 from 'pm2';
import yargs from 'yargs';

import { Configure } from '@/modules/config/configure';

import { CommandItem } from '../types';

import { getPm2Config, scripts, subpOption } from './helpers';
import { StartCommandArguments } from './types';

export const createStartCommand: CommandItem<any, StartCommandArguments> = async (app) => ({
    command: ['start', 's'],
    describe: 'Start app',
    builder: {
        silence: {
            type: 'boolean',
            alias: 's',
            describe: 'Start app in background by pm2.',
            default: false,
        },
        bun: {
            type: 'boolean',
            alias: 'b',
            describe: 'Prioritize using bun to start.',
            default: true,
        },
        typescript: {
            type: 'boolean',
            alias: 't',
            describe: 'Run the .ts file directly.',
            default: false,
        },
        watch: {
            type: 'boolean',
            alias: 'w',
            describe:
                'Run in watch mode ,can be used in all environments (but this option is invalid in production environments not started by PM2).',
            default: false,
        },
        debug: {
            type: 'boolean',
            alias: 'd',
            describe: 'Whether to enable debug mode, only valid for non-production environments',
            default: false,
        },
        prod: {
            type: 'boolean',
            alias: 'p',
            describe:
                'If NODE_ENV is not set, you can use it to force the application to run in the production environment.',
            default: false,
        },
    },
    handler: async (args: yargs.Arguments<StartCommandArguments>) => {
        const { configure } = app;
        const script = args.typescript ? scripts.ts : scripts.js;
        if (configure.env.isProd()) {
            args.silence ? await startPm2(configure, args, script) : await startProd(args, script);
        } else {
            await startDev(args);
        }
    },
});

/**
 * 生产环境下使用PM2静默启动应用
 * @param configure
 * @param args
 * @param script
 */
const startPm2 = async (
    configure: Configure,
    args: yargs.Arguments<StartCommandArguments>,
    script: string,
) => {
    const config = await getPm2Config(
        configure,
        {
            command: 'start',
            ...pick(args, ['watch', 'typescript', 'bun']),
        },
        script,
    );
    pm2.connect((cerr) => {
        if (cerr) {
            console.error(cerr);
            process.exit(2);
        }
        pm2.start(config, (serr) => {
            if (serr) {
                console.error(serr);
                return pm2.disconnect();
            }

            return pm2.list(() => pm2.restart(config.name, () => pm2.disconnect()));
        });
    });
    pm2.disconnect();
};

/**
 * 生产环境下正常启动应用
 * 如果直接运行TS源码或者设置了优先使用bun启动,则使用bun启动应用
 * 否则使用node fork一个子进程启动main.js
 * @param args
 * @param script
 */
const startProd = async (args: yargs.Arguments<StartCommandArguments>, script: string) => {
    if (args.typescript || args.bun) {
        Bun.spawn([scripts.bun, script], subpOption.bun);
    } else {
        const child = fork(script, subpOption.fork);
        child.on('exit', () => exit());
    }
};

/**
 * 非生产环境(开发环境等)下使用nest cli启动应用
 * 逻辑如下:
 * 如果设置了优先使用bun启动则使用bun运行nest cli
 * 如果不是则使用node fork一个子进程运行nest cli
 * @param args
 * @param script
 */
const startDev = async (args: yargs.Arguments<StartCommandArguments>) => {
    const params: string[] = ['start'];
    if (args.watch) params.push('-w');
    if (args.debug) params.push('-d');
    if (args.bun) {
        Bun.spawn([scripts.bun, scripts.nest, ...params], subpOption.bun);
    } else {
        const child = fork(scripts.nest, params, subpOption.fork);
        child.on('exit', () => exit());
    }
};
