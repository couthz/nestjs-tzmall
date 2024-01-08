import { Arguments } from 'yargs';

import { CommandItem } from '../types';

import { getCLIConfig } from './helpers/config';
import { startPM2 } from './helpers/start';
import { PM2Arguments } from './types';

export const createPm2Command: CommandItem<any, PM2Arguments> = async (app) => ({
    command: ['pm2'],
    describe: 'Start app in prod by pm2',
    builder: {
        entry: {
            type: 'string',
            alias: 'e',
            describe:
                'Specify entry file for ts runner, you can specify js entry file in nest-cli.json by entryFile.',
            default: 'dist/main.js',
        },
        restart: {
            type: 'boolean',
            alias: 'r',
            describe: 'Retart app(only pm2),pm2 will auto run start if process not exists.',
            default: false,
        },
        watch: {
            type: 'boolean',
            alias: 'w',
            describe: ' Run in watch mode (live-reload).',
            default: false,
        },
        debug: {
            type: 'boolean',
            alias: 'd',
            describe: 'Whether to enable debug mode, only valid for non-production environments',
            default: false,
        },
    },
    handler: async (args: Arguments<PM2Arguments>) => {
        const { configure } = app;
        const config = getCLIConfig(args.tsConfig, args.nestConfig, args.entry);
        if (args.restart) await startPM2(configure, args, config);
    },
});
