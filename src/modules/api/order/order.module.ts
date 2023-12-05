import { Configure } from "@/common/config/configure";
import { OrderServiceModule } from "@/service/order/order-service.module";
import { Module } from "@nestjs/common";

@Module({})
export class OrderModule {
    static async forRoot(configure: Configure) {
        const orderServiceModule = await OrderServiceModule.forRoot(configure);
        return {
            module: OrderModule,
            imports: [
                orderServiceModule
            ],
            exports: [
                orderServiceModule
            ]
        };
    }
}
