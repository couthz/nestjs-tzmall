import { Module, ModuleMetadata } from '@nestjs/common';


import * as entities from './entities';
import * as repositories from './repositories';
import * as services from './services';
import { Configure } from '../config/configure';
import { addEntities } from '../database/helpers';
import { DatabaseModule } from '../database/database.module';

@Module({})
export class ProdModule {
    static async forRoot(configure: Configure) {
        const providers: ModuleMetadata['providers'] = [...Object.values(services)];
        return {
            module: ProdModule,
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
