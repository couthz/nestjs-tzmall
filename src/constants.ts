import { NestFactory } from '@nestjs/core';

import { FastifyAdapter, NestFastifyApplication } from '@nestjs/platform-fastify';

import * as configs from './config';
import { ContentModule } from './modules/content/content.module';
import { CreateOptions } from './modules/core/types';
import { DatabaseModule } from './modules/database/database.module';
import { MeilliModule } from './modules/meilisearch/melli.module';

export const WEBAPP = 'web';
export const createData: CreateOptions = {
    config: { factories: configs, storage: { enabled: true } },
    imports: async (configure) => [
        ContentModule.forRoot(configure),
        DatabaseModule.forRoot(configure),
        MeilliModule.forRoot(configure),
    ],
    globals: {},
    builder: async ({ configure, BootModule }) =>
        NestFactory.create<NestFastifyApplication>(BootModule, new FastifyAdapter(), {
            cors: true,
            logger: ['error', 'warn'],
        }),
};
