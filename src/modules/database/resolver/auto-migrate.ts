import { join } from 'path';

import { Injectable } from '@nestjs/common';
import { ModuleRef } from '@nestjs/core';
import { DataSource, DataSourceOptions } from 'typeorm';

import { Configure } from '@/modules/config/configure';

import { panic } from '@/modules/core/helpers';

import { TypeormMigrationRun } from '../commands/tyeporm-migration-run';
import { DbConfig } from '../types';

@Injectable()
export class AutoMigrate {
    constructor(private moduleRef: ModuleRef) {}

    async onModuleInit() {
        const configure = this.moduleRef.get(Configure, { strict: false });
        const { connections = [] }: DbConfig = await configure.get<DbConfig>('database');
        for (const connect of connections) {
            let dataSource: DataSource | undefined;
            if (connect.autoMigrate) {
                try {
                    const runner = new TypeormMigrationRun();
                    dataSource = new DataSource(connect as DataSourceOptions);
                    if (dataSource && dataSource.isInitialized) await dataSource.destroy();
                    dataSource.setOptions({
                        subscribers: [],
                        synchronize: false,
                        migrationsRun: false,
                        logging: ['error'],
                        migrations: [
                            join(connect.paths.migration, '**/*.ts'),
                            join(connect.paths.migration, '**/*.js'),
                        ],
                        dropSchema: false,
                    });
                    await dataSource.initialize();
                    await runner.handler({
                        dataSource,
                    });
                } catch (error) {
                    if (dataSource && dataSource.isInitialized) await dataSource.destroy();
                    panic({ message: 'Run migrations failed!', error });
                }
            }
        }
    }
}
