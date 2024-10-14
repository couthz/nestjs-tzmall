
import { Configure } from '@/modules/config/configure';
import { addEntities } from '@/modules/database/helpers';
import { Module, ModuleMetadata } from '@nestjs/common';
import * as entities from './entities';
import * as repositories from './repositories';
import * as services from './services';
import { DatabaseModule } from '@/modules/database/database.module';
import { ProdModule } from '../prod/prod.module';

@Module({})
export class ShopcartModule {
    static async forRoot(configure: Configure) {
        const providers: ModuleMetadata['providers'] = [...Object.values(services)];
        return {
            module: ShopcartModule,
            imports: [
                addEntities(configure, Object.values(entities)),
                ProdModule.forRoot(configure),
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