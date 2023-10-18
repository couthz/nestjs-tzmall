/* eslint-disable global-require */
import { existsSync } from 'fs';

import { join } from 'path';

import { NestFactory } from '@nestjs/core';

import { FastifyAdapter, NestFastifyApplication } from '@nestjs/platform-fastify';

import chalk from 'chalk';
import { isNil } from 'lodash';

import * as configs from './config';
import { ContentModule } from './modules/content/content.module';
import { App, CreateOptions } from './modules/core/types';
import { DatabaseModule } from './modules/database/database.module';
import { MeilliModule } from './modules/meilisearch/melli.module';
import { echoApi } from './modules/restful/helpers';
import { Restful } from './modules/restful/restful';
import { RestfulModule } from './modules/restful/restful.module';
import { ApiConfig } from './modules/restful/types';

export const createOptions: CreateOptions = {
    config: { factories: configs, storage: { enabled: true } },
    modules: async (configure) => [
        DatabaseModule.forRoot(configure),
        MeilliModule.forRoot(configure),
        RestfulModule.forRoot(configure),
        ContentModule.forRoot(configure),
    ],
    commands: () => [],
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
            // if use tsc
            // await restful.factoryDocs(container);
            // if use swc
            // await restful.factoryDocs(container, metadata);
            // if use bun cli
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
export const listened: (app: App, startTime: Date) => () => Promise<void> =
    ({ configure, container }, startTime) =>
    async () => {
        console.log();
        await echoApi(configure, container);
        console.log('used time:', chalk.cyan(`${new Date().getTime() - startTime.getTime()}`));
    };
