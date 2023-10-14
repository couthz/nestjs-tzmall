import pm2 from 'pm2';
import yargs from 'yargs';

import { panic } from '../helpers';
import { AppConfig, CommandItem } from '../types';

import { RestartCommandArguments } from './types';

export const createRestartCommand: CommandItem<any, RestartCommandArguments> = async (app) => ({
    command: ['reload', 'r'],
    describe: 'Restart app in pm2 and production',
    builder: {
        force: {
            type: 'boolean',
            alias: 'f',
            describe: 'If "true" run pm2 restart [app_name], else run pm2 reload [app_name]',
            default: true,
        },
    },
    handler: async (args: yargs.Arguments<RestartCommandArguments>) => {
        const { configure } = app;
        if (!configure.env.isProd()) panic('Restart command only run in production and pm2!');
        const config = await configure.get<AppConfig>('app');
        pm2.connect((cerr) => {
            if (cerr) {
                console.error(cerr);
                process.exit(2);
            }

            return pm2.list((err, items) => {
                pm2.restart(config.name, () => pm2.disconnect());
                if (items.map(({ name }) => name).includes(config.name)) {
                    args.force
                        ? pm2.restart(config.name, () => pm2.disconnect())
                        : pm2.reload(config.name, () => pm2.disconnect());
                } else {
                    pm2.disconnect();
                    panic({ message: `App ${config.name} not exists in pm2!`, exit: false });
                }
            });
        });
        pm2.disconnect();
    },
});
