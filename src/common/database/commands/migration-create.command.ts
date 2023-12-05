import { Arguments } from 'yargs';

import { CommandItem } from '@/common/core/types';

import { MigrationCreateArguments } from '../types';

import { MigrationCreateHandler } from './migration-create.handler';

/**
 * 创建迁移
 * @param param0
 */
export const CreateMigrationCommand: CommandItem<any, MigrationCreateArguments> = async ({
    configure,
}) => ({
    source: true,
    command: ['db:migration:create', 'dbmc'],
    describe: 'Creates a new migration file',
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
            demandOption: true,
        },
    } as const,

    handler: async (args: Arguments<MigrationCreateArguments>) =>
        MigrationCreateHandler(configure, args),
});
