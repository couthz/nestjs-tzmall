import { Module, DynamicModule, Type, Provider, ModuleMetadata } from '@nestjs/common';

import { TypeOrmModule, TypeOrmModuleOptions, getDataSourceToken } from '@nestjs/typeorm';

import { DataSource, ObjectType } from 'typeorm';

import { Configure } from '../config/configure';

import { panic } from '../core/helpers';

import { CUSTOM_REPOSITORY_METADATA } from './constants';
import {
    DataExistConstraint,
    UniqueConstraint,
    UniqueExistContraint,
    UniqueTreeConstraint,
    UniqueTreeExistConstraint,
} from './constraints';
import { AutoMigrate } from './resolver/auto-migrate';
import { DbOptions } from './types';

@Module({})
export class DatabaseModule {
    static async forRoot(configure: Configure) {
        if (!configure.has('database')) {
            panic({ message: 'Database config not exists or not right!' });
        }
        const { connections } = await configure.get<DbOptions>('database');
        const imports: ModuleMetadata['imports'] = [];
        for (const dbOption of connections) {
            imports.push(TypeOrmModule.forRoot(dbOption as TypeOrmModuleOptions));
        }
        const providers: ModuleMetadata['providers'] = [
            DataExistConstraint,
            UniqueConstraint,
            UniqueExistContraint,
            UniqueTreeConstraint,
            UniqueTreeExistConstraint,
            AutoMigrate,
        ];

        return {
            global: true,
            module: DatabaseModule,
            imports,
            providers,
        };
    }

    static forRepository<T extends Type<any>>(
        repositories: T[],
        dataSourceName?: string,
    ): DynamicModule {
        const providers: Provider[] = [];

        for (const Repo of repositories) {
            const entity = Reflect.getMetadata(CUSTOM_REPOSITORY_METADATA, Repo);

            if (!entity) {
                continue;
            }

            providers.push({
                inject: [getDataSourceToken(dataSourceName)],
                provide: Repo,
                useFactory: (dataSource: DataSource): InstanceType<typeof Repo> => {
                    const base = dataSource.getRepository<ObjectType<any>>(entity);
                    return new Repo(base.target, base.manager, base.queryRunner);
                },
            });
        }
        return {
            exports: providers,
            module: DatabaseModule,
            providers,
        };
    }
}
