/* eslint-disable global-require */
import { existsSync } from 'fs';

import { join } from 'path';

import { NestFactory } from '@nestjs/core';

import { FastifyAdapter, NestFastifyApplication } from '@nestjs/platform-fastify';

import { isNil } from 'lodash';

import * as configs from './config';
import { CreateOptions } from './common/core/types';
import * as dbCommands from './common/database/commands';
import { DatabaseModule } from './common/database/database.module';
import { MeilliModule } from './common/meilisearch/melli.module';
import { ProdModule } from './modules/api/prod/prod.module';
import { Restful } from './common/restful/restful';
import { RestfulModule } from './common/restful/restful.module';
import { ApiConfig } from './common/restful/types';
import { ShopcartModule } from './modules/api/shopcart/shopcart.module';
import { RedisClientModule } from './common/redis/redis-client.module';
import { OrderModule } from './modules/api/order/order.module';
import { UserModule } from './modules/api/user/user.module';

export const createOptions: CreateOptions = {
    config: { factories: configs, storage: { enabled: true } },
    // 函数而非静态模块的原因是因为需要传入configure
    modules: async (configure) => [
        DatabaseModule.forRoot(configure),
        MeilliModule.forRoot(configure),
        RestfulModule.forRoot(configure),
        ProdModule.forRoot(configure),
        ShopcartModule.forRoot(configure),
        RedisClientModule.forRoot(configure),
        OrderModule.forRoot(configure),
        UserModule.forRoot(configure),
        ShopcartModule.forRoot(configure),
    ],
    commands: () => [...Object.values(dbCommands)],
    globals: {},
    builder: async ({ configure, BootModule }) => {
        const container = await NestFactory.create<NestFastifyApplication>(
            BootModule,
            new FastifyAdapter(),
            {
                cors: true,
                logger: ['error', 'warn'],
            },
        );
        if (!isNil(await configure.get<ApiConfig>('api', null))) {
            const restful = container.get(Restful);
            /**
             * 判断是否存在metadata模块,存在的话则加载并传入factoryDocs
             */
            let metadata: () => Promise<Record<string, any>>;
            if (existsSync(join(__dirname, 'metadata.js'))) {
                metadata = require(join(__dirname, 'metadata.js')).default;
            }
            if (existsSync(join(__dirname, 'metadata.ts'))) {
                metadata = require(join(__dirname, 'metadata.ts')).default;
            }
            await restful.factoryDocs(container, metadata);
        }
        return container;
    },
};
