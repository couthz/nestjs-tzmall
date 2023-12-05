import { join } from 'path';

import chalk from 'chalk';
import { isNil } from 'lodash';
import ora from 'ora';
import { DataSource, DataSourceOptions } from 'typeorm';
import { Arguments } from 'yargs';

import { Configure } from '@/common/config/configure';
import { panic } from '@/common/core/helpers';

import { DbConfig, MigrationRevertArguments } from '../types';

import { TypeormMigrationRevert } from './typeorm-migration.revert';

/**
 * 移除迁移处理器
 * @param configure
 * @param args
 */
export const MigrationRevertHandler = async (
    configure: Configure,
    args: Arguments<MigrationRevertArguments>,
) => {
    const spinner = ora('Start to revert migrations');
    const cname = args.connection ?? 'default';
    let dataSource: DataSource | undefined;
    try {
        spinner.start();
        const { connections = [] }: DbConfig = await configure.get<DbConfig>('database');
        const dbConfig = connections.find(({ name }) => name === cname);
        if (isNil(dbConfig)) panic(`Database connection named ${cname} not exists!`);
        console.log();
        const revert = new TypeormMigrationRevert();
        dataSource = new DataSource({ ...dbConfig } as DataSourceOptions);
        dataSource.setOptions({
            subscribers: [],
            synchronize: false,
            migrationsRun: false,
            dropSchema: false,
            logging: ['error'],
            migrations: [
                join(dbConfig.paths.migration, '**/*.js'),
                join(dbConfig.paths.migration, '**/*.ts'),
            ],
        });
        await dataSource.initialize();
        console.log();
        await revert.handler({
            dataSource,
            transaction: args.transaction,
            fake: args.fake,
        });
        await dataSource.destroy();
        spinner.succeed(chalk.greenBright.underline('\n 👍 Finished revert migrations'));
    } catch (error) {
        if (dataSource && dataSource.isInitialized) await dataSource.destroy();
        panic({ spinner, message: 'Revert migrations failed!', error });
    }
};
