import { Arguments } from 'yargs';

import { CommandItem } from '../types';

import { getCLIConfig } from './helpers/config';
import { start, startPM2 } from './helpers/start';
import { StartCommandArguments } from './types';

export const createStartCommand: CommandItem<any, StartCommandArguments> = async (app) => ({
    command: ['start', 's'],
    describe: 'Start app',
    builder: {
        nestConfig: {
            type: 'string',
            alias: 'n',
            describe: 'nest cli config file path.',
            default: 'nest-cli.json',
        },
        tsConfig: {
            type: 'string',
            alias: 't',
            describe: 'typescript config file path.',
            default: 'tsconfig.build.json',
        },
        entry: {
            type: 'string',
            alias: 'e',
            describe:
                'Specify entry file for ts runner, you can specify js entry file in nest-cli.json by entryFile.',
            default: 'main.ts',
        },
        prod: {
            type: 'boolean',
            alias: 'p',
            describe: 'Start app in production by pm2.',
            default: false,
        },
        restart: {
            type: 'boolean',
            alias: 'r',
            describe: 'Retart app(only pm2),pm2 will auto run start if process not exists.',
            default: false,
        },
        typescript: {
            type: 'boolean',
            alias: 'ts',
            describe: 'Run the .ts file directly.',
            default: true,
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
    handler: async (args: Arguments<StartCommandArguments>) => {
        const { configure } = app;
        const config = getCLIConfig(args.tsConfig, args.nestConfig, args.entry);
        if (args.prod || args.restart) await startPM2(configure, args, config);
        else await start(args, config);
    },
});
