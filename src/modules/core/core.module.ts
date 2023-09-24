import { DynamicModule, Module } from '@nestjs/common';

@Module({})
export class CoreModule {
    static forRoot(): DynamicModule {
        return {
            module: CoreModule,
            global: true,
            providers: [],
            exports: [],
        };
    }
}
