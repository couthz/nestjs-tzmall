import { DynamicModule, Module } from '@nestjs/common';

import { createMeilliOptions } from './helpers';
import { MeilliService } from './meilli.service';
import { MelliConfig } from './types';

@Module({})
export class MeilliModule {
    static forRoot(configRegister: () => MelliConfig): DynamicModule {
        return {
            global: true,
            module: MeilliModule,
            providers: [
                {
                    provide: MeilliService,
                    useFactory: async () => {
                        const service = new MeilliService(
                            await createMeilliOptions(configRegister()),
                        );
                        service.createClients();
                        return service;
                    },
                },
            ],
            exports: [MeilliService],
        };
    }
}
