import { Logger, Module, ModuleMetadata } from '@nestjs/common';
import { Configure } from '../../common/config/configure';
import { DatabaseModule } from '../../common/database/database.module';
import { addEntities } from '../../common/database/helpers';
import * as entities from './entities';
import * as repositories from './repositories';
import * as services from './services';
import { HttpModule } from '@nestjs/axios';
import { JwtModule } from '@nestjs/jwt';

@Module({})
export class UserServiceModule {
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
            module: UserServiceModule,
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
