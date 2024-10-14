import { existsSync } from 'fs';

import path, { join } from 'path';

import { NestFactory } from '@nestjs/core';

import { FastifyAdapter, NestFastifyApplication } from '@nestjs/platform-fastify';

import { isNil } from 'lodash';

import * as configs from './config';
import { CreateOptions } from './modules/core/types';
import * as dbCommands from './modules/database/commands';
import { DatabaseModule } from './modules/database/database.module';
import { MeilliModule } from './modules/meilisearch/melli.module';
import { Restful } from './modules/restful/restful';
import { RestfulModule } from './modules/restful/restful.module';
import { ApiConfig } from './modules/restful/types';
import { UserModule } from './modules/user/user.module';
import { OrderModule } from './modules/order/order.module';
import { ProdModule } from './modules/prod/prod.module';
import { ShopcartModule } from './modules/shopcart/shopcart.module';
import { RedisClientModule } from './modules/redis/redis-client.module';
import { UploadModule } from './modules/upload/upload.module';
import { AreaModule } from './modules/area/area.module';
import { MqClientModule } from './modules/mq/mq-client.module';
import { BullModule } from '@nestjs/bull';
import { WeChatPayModule } from 'nest-wechatpay-node-v3';
import fs from 'fs';


export const createOptions: CreateOptions = {
    config: { factories: configs, storage: { enabled: true } },
    modules: async (configure) => [
        DatabaseModule.forRoot(configure),
        OrderModule.forRoot(configure),
        ProdModule.forRoot(configure),
        ShopcartModule.forRoot(configure),
        AreaModule.forRoot(configure),
        MeilliModule.forRoot(configure),
        RestfulModule.forRoot(configure),
        UserModule.forRoot(configure),
        RedisClientModule.forRoot(configure),
        UploadModule.forRoot(configure),
        BullModule.registerQueue({
            name: 'order',
            redis: {
              port: 6379,
            },
          }),
          
        // MqClientModule.forRoot(configure),
    ],
    commands: () => [...Object.values(dbCommands)],
    // globals: {
    //     guard: RbacGuard,
    // },
    builder: async ({ configure, BootModule }) => {
        const container = await NestFactory.create<NestFastifyApplication>(
            BootModule,
            new FastifyAdapter(),
            {
                cors: true,
                logger: ['error', 'warn'],
            },
        );

        container.useStaticAssets({ root: path.join(__dirname, '..', 'public') });
        // https://github.com/fastify/fastify-multipart/
        // eslint-disable-next-line global-require
        await container.register(require('@fastify/multipart'), {
            attachFieldsToBody: true,
            limits: {
            fileSize: 1024 * 1024 * 10, // 10M
            files: 1,
            },
        });
        
        if (!isNil(await configure.get<ApiConfig>('api', null))) {
            const restful = container.get(Restful);
            /**
             * 判断是否存在metadata模块,存在的话则加载并传入factoryDocs
             */
            let metadata: () => Promise<Record<string, any>>;
            if (existsSync(join(__dirname, 'metadata.js'))) {
                metadata = (await import(join(__dirname, 'metadata.js'))).default;
            }
            if (existsSync(join(__dirname, 'metadata.ts'))) {
                metadata = (await import(join(__dirname, 'metadata.ts'))).default;
            }
            await restful.factoryDocs(container, metadata);
        }
        return container;
    },
};
