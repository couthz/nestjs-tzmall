import { Module, ModuleMetadata } from '@nestjs/common';

import { Configure } from '../../common/config/configure';
import { DatabaseModule } from '../../common/database/database.module';

import { addEntities } from '../../common/database/helpers';

import * as entities from './entities';
import * as repositories from './repositories';
import * as services from './services';

@Module({})
export class ProdServiceModule {
    static async forRoot(configure: Configure) {
        const providers: ModuleMetadata['providers'] = [...Object.values(services)];
        return {
            module: ProdServiceModule,
            imports: [
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
