
import { Configure } from '@/common/config/configure';
import { addEntities } from '@/common/database/helpers';
import { Module, ModuleMetadata } from '@nestjs/common';
import * as entities from './entities';
import * as repositories from './repositories';
import * as services from './services';
import { ProdServiceModule } from '../prod/prod-service.module';
import { DatabaseModule } from '@/common/database/database.module';

@Module({})
export class ShopcartServiceModule {
    static async forRoot(configure: Configure) {
        const providers: ModuleMetadata['providers'] = [...Object.values(services)];
        return {
            module: ShopcartServiceModule,
            imports: [
                addEntities(configure, Object.values(entities)),
                ProdServiceModule.forRoot(configure),
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