import { Configure } from "@/common/config/configure";
import { ProdServiceModule } from "@/service/prod/prod-service.module";
import { Module } from "@nestjs/common";

@Module({})
export class ProdModule {
    static async forRoot(configure: Configure) {
        const prodServiceModule = await ProdServiceModule.forRoot(configure);
        return {
            module: ProdModule,
            imports: [
                prodServiceModule
            ],
            exports: [
                prodServiceModule
            ]
        };
    }
}