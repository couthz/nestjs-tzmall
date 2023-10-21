import { spawn } from 'child_process';

import { exit } from 'process';

import { Arguments } from 'yargs';

import { CommandItem } from '../types';

import { getCLIConfig } from './helpers/config';
import { BuildCommandArguments } from './types';

export const createBuildCommand: CommandItem<any, BuildCommandArguments> = async (app) => ({
    command: ['build', 'b'],
    describe: 'Build application by nest cli.',
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
        watch: {
            type: 'boolean',
            alias: 'w',
            describe: ' Run in watch mode (live-reload).',
            default: false,
        },
        preserveWatchOutput: {
            type: 'boolean',
            alias: 'po',
            describe: 'Use "preserveWatchOutput" option when using tsc watch mode',
            default: false,
        },
    },
    handler: async (args: Arguments<BuildCommandArguments>) => {
        const config = getCLIConfig(args.tsConfig, args.nestConfig);
        const params = ['build', '-c', args.nestConfig, '-p', args.tsConfig];
        if (args.watch) params.push('-w');
        if (args.preserveWatchOutput) params.push('po');
        const child = spawn(config.paths.nest, params, config.subprocess.node);
        child.on('exit', () => exit());
    },
});
