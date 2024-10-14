
import { Configure } from '@/modules/config/configure';
import { addEntities } from '@/modules/database/helpers';
import { Module, ModuleMetadata } from '@nestjs/common';
import * as entities from './entities';
import * as repositories from './repositories';
import * as services from './services';
import { DatabaseModule } from '@/modules/database/database.module';

@Module({})
export class AreaModule {
    static async forRoot(configure: Configure) {
        const providers: ModuleMetadata['providers'] = [...Object.values(services)];
        return {
            module: AreaModule,
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