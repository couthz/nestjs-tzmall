import { Configure } from '@/common/config/configure';
import { ShopcartServiceModule } from '@/service/shopcart/shopcart-service.module';
import { Module } from '@nestjs/common';

@Module({})
export class ShopcartModule {
    static async forRoot(configure: Configure) {
        const shopcartServiceModule = await ShopcartServiceModule.forRoot(configure);
        return {
            module: ShopcartModule,
            imports: [
                shopcartServiceModule
            ],
            exports: [
                shopcartServiceModule
            ]
        };
    }
}
