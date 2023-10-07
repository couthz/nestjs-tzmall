import { INestApplication } from '@nestjs/common';
import { Test, TestingModule } from '@nestjs/testing';
import request from 'supertest';

import { createData } from '@/constants';
import { Configure } from '@/modules/config/configure';
import { createBootModule } from '@/modules/core/helpers';

describe('AppController (e2e)', () => {
    let app: INestApplication;

    beforeEach(async () => {
        const configure = new Configure();
        configure.initilize(createData.config.factories, createData.config.storage);
        const BootModule = await createBootModule(configure, {
            imports: createData.imports,
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
