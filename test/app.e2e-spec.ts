import { INestApplication } from '@nestjs/common';
import { Test, TestingModule } from '@nestjs/testing';
import request from 'supertest';

import { createOptions } from '@/constants';
import { Configure } from '@/common/config/configure';
import { createBootModule } from '@/common/core/helpers';

describe('AppController (e2e)', () => {
    let app: INestApplication;

    beforeEach(async () => {
        const configure = new Configure();
        const { config, modules } = createOptions;
        configure.initilize(config.factories, config.storage);
        const BootModule = await createBootModule(configure, {
            modules,
        });
        const moduleFixture: TestingModule = await Test.createTestingModule({
            imports: [BootModule],
        }).compile();

        app = moduleFixture.createNestApplication();
        await app.init();
    });

    // eslint-disable-next-line jest/expect-expect
    it('/ (GET)', () => {
        return request(app.getHttpServer()).get('/').expect(200).expect('Hello World!');
    });
});
