import { Arguments } from 'yargs';

import { CommandItem } from '@/common/core/types';

import { MigrationGenerateArguments } from '../types';

import { MigrationGenerateHandler } from './migration-generate.handler';

/**
 * 生成迁移
 * @param param0
 */
export const GenerateMigrationCommand: CommandItem<any, MigrationGenerateArguments> = async ({
    configure,
}) => ({
    instant: true,
    command: ['db:migration:generate', 'dbmg'],
    describe: 'Auto generates a new migration file with sql needs to be executed to update schema.',
    builder: {
        connection: {
            type: 'string',
            alias: 'c',
            describe: 'Connection name of typeorm to connect database.',
        },
        name: {
            type: 'string',
            alias: 'n',
            describe: 'Name of the migration class.',
        },
        run: {
            type: 'boolean',
            alias: 'r',
            describe: 'Run migration after generated.',
            default: false,
        },
        dir: {
            type: 'string',
            alias: 'd',
            describe: 'Which directory where migration should be generated.',
        },
        pretty: {
            type: 'boolean',
            alias: 'p',
            describe: 'Pretty-print generated SQL',
            default: false,
        },
        dryrun: {
            type: 'boolean',
            alias: 'dr',
            describe: 'Prints out the contents of the migration instead of writing it to a file',
            default: false,
        },
        check: {
            type: 'boolean',
            alias: 'ch',
            describe:
                'Verifies that the current database is up to date and that no migrations are needed. Otherwise exits with code 1.',
            default: false,
        },
    } as const,

    handler: async (args: Arguments<MigrationGenerateArguments>) =>
        MigrationGenerateHandler(configure, args),
});
