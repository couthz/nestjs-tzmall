import { spawn } from 'child_process';

import { exit } from 'process';

import { Arguments } from 'yargs';

import { CommandItem } from '../types';

import { getCLIConfig } from './helpers';
import { NestCommandArguments } from './types';

export const createNestCommand: CommandItem<any, NestCommandArguments> = async (app) => ({
    command: ['nest [cmds..]', 'n'],
    describe: 'Run nest cli commands by bun',
    builder: {},
    handler: async (args: Arguments<NestCommandArguments>) => {
        const config = getCLIConfig('tsconfig.json', 'nest-cli.json');
        const options = args._.filter((v, i) => i !== 0) as string[];
        const commands = [...(args.cmds ?? []), ...options];
        const child = spawn(config.paths.nest, commands, config.subprocess.node);
        child.on('exit', () => exit());
    },
});
