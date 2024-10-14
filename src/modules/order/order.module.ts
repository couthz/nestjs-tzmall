import { Module, ModuleMetadata } from '@nestjs/common';
import fs from 'fs';

import * as entities from './entities';
import * as repositories from './repositories';
import * as services from './services';
import { UserModule } from '../user/user.module';
import { DatabaseModule } from '../database/database.module';
import { addEntities } from '../database/helpers';
import { Configure } from '../config/configure';
import { WeChatPayModule } from 'nest-wechatpay-node-v3';
import { ShopcartModule } from '../shopcart/shopcart.module';
import { HttpModule } from '@nestjs/axios';

@Module({})
export class OrderModule {
    static async forRoot(configure: Configure) {
        const providers: ModuleMetadata['providers'] = [...Object.values(services)];
        return {
            module: OrderModule,
            imports: [
              HttpModule,
                UserModule.forRoot(configure),
                ShopcartModule.forRoot(configure),
                addEntities(configure, Object.values(entities)),
                DatabaseModule.forRepository(Object.values(repositories)),
                // WeChatPayModule.registerAsync({
                //     useFactory: async () => {
                //       return {
                //         appid: process.env.MINIPROGRAM_APP_ID,
                //         mchid: process.env.MCH_ID,
                //         publicKey: fs.readFileSync('/Users/zhengheci/Desktop/3r/course-project/copy/nestjs/public/cert/apiclient_cert.pem'), // 公钥
                //         privateKey: fs.readFileSync('/Users/zhengheci/Desktop/3r/course-project/copy/nestjs/public/cert/apiclient_key.pem'), // 秘钥
                //       };
                //     },
                //   }),
            ],
            providers,
            exports: [
                ...Object.values(services),
                DatabaseModule.forRepository(Object.values(repositories)),
            ],
        };
    }
}
