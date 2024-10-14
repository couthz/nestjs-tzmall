import { Module, ModuleMetadata } from "@nestjs/common";
import { Configure } from "../config/configure";
import { panic } from "../core/helpers";
import { BullModule, BullModuleOptions } from '@nestjs/bull';
import { OrderProcessor } from "./order.processor";
import { OrderModule } from "../order/order.module";


@Module({})
export class MqClientModule {
    static async forRoot(configure: Configure) {
        if (!configure.has('bull')) {
            console.log("bull config error:")
            panic({ message: 'bull config not exists or not right!' });
        }
        const imports: ModuleMetadata['imports'] = [];
        const options = await configure.get<BullModuleOptions>('bull');
        imports.push(BullModule.forRoot({name:"order", ...options}));
        imports.push(OrderModule);

        return {
            global: true,
            module: MqClientModule,
            imports,
            providers: [OrderProcessor],
            exports: [OrderProcessor],
        };
    }
}
