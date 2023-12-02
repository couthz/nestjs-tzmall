import { Module } from '@nestjs/common';

import { JwtModule, JwtModuleOptions } from '@nestjs/jwt';
import { PassportModule } from '@nestjs/passport';

import { Configure } from '../config/configure';
import { DatabaseModule } from '../database/database.module';

import { addEntities, addSubscribers } from '../database/helpers';

import * as entities from './entities';
import * as guards from './guards';
import { defaultUserConfig } from './helpers';
import * as repositories from './repositories';
import * as services from './services';
import * as strategies from './strategies';
import * as subscribers from './subscribers';
import { UserConfig } from './types';

const jwtModuleRegister = (configure: Configure) => async (): Promise<JwtModuleOptions> => {
    const config = await configure.get<UserConfig>('user', defaultUserConfig(configure));
    const option: JwtModuleOptions = {
        secret: config.jwt.secret,
        verifyOptions: {
            ignoreExpiration: !configure.env.isProd(),
        },
    };
    if (configure.env.isProd()) option.signOptions.expiresIn = `${config.jwt.token_expired}s`;
    return option;
};
@Module({})
export class UserModule {
    static async forRoot(configure: Configure) {
        return {
            module: UserModule,
            imports: [
                PassportModule,
                JwtModule.registerAsync({
                    useFactory: jwtModuleRegister(configure),
                }),
                addEntities(configure, Object.values(entities)),
                DatabaseModule.forRepository(Object.values(repositories)),
            ],
            providers: [
                ...Object.values(services),
                ...(await addSubscribers(configure, Object.values(subscribers))),
                ...Object.values(strategies),
                ...Object.values(guards),
            ],
            exports: [
                ...Object.values(services),
                DatabaseModule.forRepository(Object.values(repositories)),
            ],
        };
    }
}
