import { join } from 'path';

import chalk from 'chalk';
import { isNil } from 'lodash';
import ora from 'ora';
import { DataSource, DataSourceOptions } from 'typeorm';

import { Arguments } from 'yargs';

import { Configure } from '@/common/config/configure';
import { panic } from '@/common/core/helpers';

import { DbConfig, MigrationRunArguments } from '../types';

import { TypeormMigrationRun } from './tyeporm-migration-run';

/**
 * 运行迁移处理器
 * @param configure
 * @param args
 */
export const MigrationRunHandler = async (
    configure: Configure,
    args: Arguments<MigrationRunArguments>,
) => {
    const spinner = ora('Start to run migrations');
    const cname = args.connection ?? 'default';
    let dataSource: DataSource | undefined;
    try {
        spinner.start();
        const { connections = [] }: DbConfig = await configure.get<DbConfig>('database');
        const dbConfig = connections.find(({ name }) => name === cname);
        if (isNil(dbConfig)) panic(`Database connection named ${cname} not exists!`);
        let dropSchema = false;
        dropSchema = args.refresh || args.onlydrop;
        console.log();
        const runner = new TypeormMigrationRun();
        dataSource = new DataSource({ ...dbConfig } as DataSourceOptions);
        if (dataSource && dataSource.isInitialized) await dataSource.destroy();
        const options = {
            subscribers: [],
            synchronize: false,
            migrationsRun: false,
            dropSchema,
            logging: ['error'],
            migrations: [
                join(dbConfig.paths.migration, '**/*.ts'),
                join(dbConfig.paths.migration, '**/*.js'),
            ],
        } as any;
        if (dropSchema) {
            dataSource.setOptions(options);
            await dataSource.initialize();
            await dataSource.destroy();
            spinner.succeed(chalk.greenBright.underline('\n 👍 Finished drop database schema'));
            if (args.onlydrop) process.exit();
        }
        dataSource.setOptions({ ...options, dropSchema: false });
        await dataSource.initialize();
        console.log();
        await runner.handler({
            dataSource,
            transaction: args.transaction,
            fake: args.fake,
        });
        spinner.succeed(chalk.greenBright.underline('\n 👍 Finished run migrations'));
    } catch (error) {
        if (dataSource && dataSource.isInitialized) await dataSource.destroy();
        panic({ spinner, message: 'Run migrations failed!', error });
    }

    if (dataSource && dataSource.isInitialized) await dataSource.destroy();
};
