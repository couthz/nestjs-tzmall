import chalk from 'chalk';
import yargs, { Arguments, CommandModule } from 'yargs';

import { hideBin } from 'yargs/helpers';

import * as coreCommands from '../commands';
import { App, CommandCollection } from '../types';

export async function createCommands(
    factory: () => CommandCollection,
    app: Required<App>,
): Promise<CommandModule<any, any>[]> {
    const collection: CommandCollection = [...factory(), ...Object.values(coreCommands)];
    const commands = await Promise.all(collection.map(async (command) => command(app)));
    return commands.map((command) => ({
        ...command,
        handler: async (args: Arguments<RecordAny>) => {
            await app.container.close();
            await command.handler(args);
            if (command.instant) process.exit();
        },
    }));
}

export async function buildCli(creator: () => Promise<App>) {
    const app = await creator();
    const bin = yargs(hideBin(process.argv));
    app.commands.forEach((command) => bin.command(command));
    bin.usage('Usage: $0 <command> [args]')
        .scriptName('cli')
        .demandCommand(1, '')
        .fail((msg, err, y) => {
            if (!msg && !err) {
                bin.showHelp();
                process.exit();
            }
            if (msg) console.error(chalk.red(msg));
            if (err) console.error(chalk.red(err.message));
            process.exit();
        })
        .strict()
        .alias('v', 'version')
        .help('h')
        .alias('h', 'help')
        .parse();
}
