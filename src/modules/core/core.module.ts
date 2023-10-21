import { DynamicModule, Module } from '@nestjs/common';

import { Configure } from '../config/configure';

@Module({})
export class CoreModule {
    static async forRoot(configure: Configure): Promise<DynamicModule> {
        await configure.store('app.name');
        return {
            module: CoreModule,
            global: true,
            providers: [],
            exports: [],
        };
    }
}
