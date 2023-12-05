import { Configure } from "@/common/config/configure";
import { UserServiceModule } from "@/service/user/user-service.module";
import { Module } from "@nestjs/common";

@Module({})
export class UserModule {
    static async forRoot(configure: Configure) {
        const userServiceModule = await UserServiceModule.forRoot(configure);
        return {
            module: UserModule,
            imports: [
                userServiceModule
            ],
            exports: [
                userServiceModule
            ]
        };
    }
}
