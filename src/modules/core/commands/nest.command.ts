import { fork } from 'child_process';

import { exit } from 'process';

import yargs from 'yargs';

import { CommandItem } from '../types';

import { scripts, subpOption } from './helpers';
import { NestCommandArguments } from './types';

export const createNestCommand: CommandItem<any, NestCommandArguments> = async (app) => ({
    command: ['nest [cmds..]', 'n'],
    describe: 'Run nest cli commands by bun',
    builder: {
        bun: {
            type: 'boolean',
            alias: 'b',
            describe: 'Run command in bun.',
            default: true,
        },
    },
    handler: async (args: yargs.Arguments<NestCommandArguments>) => {
        const options = args._.filter((v, i) => i !== 0) as string[];
        const commands = [...(args.cmds ?? []), ...options];
        if (args.bun) {
            Bun.spawn([scripts.bun, scripts.nest, ...commands], subpOption.bun);
        } else {
            const child = fork(scripts.nest, commands, subpOption.fork);
            child.on('exit', () => exit());
        }
    },
});
