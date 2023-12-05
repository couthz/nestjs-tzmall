import { Module, ModuleMetadata } from "@nestjs/common";
import { Configure } from "../config/configure";
import { panic } from "../core/helpers";
import { RedisClientService } from "./redis-client.service";
import { RedisModule, RedisModuleOptions } from "@liaoliaots/nestjs-redis";

@Module({})
export class RedisClientModule {
    static async forRoot(configure: Configure) {
        if (!configure.has('redis')) {
            panic({ message: 'Database config not exists or not right!' });
        }
        const imports: ModuleMetadata['imports'] = [];
        const options = await configure.get<RedisModuleOptions>('redis');
        imports.push(RedisModule.forRoot(options));
        return {
            global: true,
            module: RedisClientModule,
            imports,
            providers: [RedisClientService],
            exports: [RedisClientService],
        };
    }
}
