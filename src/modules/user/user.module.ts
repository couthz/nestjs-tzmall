import { Logger, Module, ModuleMetadata } from '@nestjs/common';
import { Configure } from '../config/configure';
import { DatabaseModule } from '../database/database.module';
import { addEntities } from '../database/helpers';
import * as entities from './entities';
import * as repositories from './repositories';
import * as services from './services';
import { HttpModule } from '@nestjs/axios';
import { JwtModule } from '@nestjs/jwt';

@Module({})
export class UserModule {
    static async forRoot(configure: Configure) {
        const providers: ModuleMetadata['providers'] = [...Object.values(services)];
        providers.push({
            provide: 'userLogger',
            useFactory: () => {
              return new Logger('user');
            },
          },
        );
        return {
            module: UserModule,
            imports: [
                HttpModule,
                JwtModule.register({
                    global: true,
                    secret: "" + process.env.JWT_SECRET,
                    signOptions: { expiresIn: process.env.JWT_EXPIRES_IN +  's' },
                  }),
                addEntities(configure, Object.values(entities)),
                DatabaseModule.forRepository(Object.values(repositories)),
            ],
            providers,
            exports: [
                ...Object.values(services),
                DatabaseModule.forRepository(Object.values(repositories)),
            ],
        };
    }
}
