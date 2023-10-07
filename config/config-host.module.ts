import { Global, Module } from '@nestjs/common';
import {
    CONFIGURATION_SERVICE_TOKEN,
    CONFIGURATION_TOKEN,
} from '@nestjs/config/dist/config.constants';

import { configToken, configure } from './configure.service';

@Global()
@Module({
    providers: [
        {
            provide: CONFIGURATION_TOKEN,
            useValue: configToken,
        },
        {
            provide: CONFIGURATION_SERVICE_TOKEN,
            useValue: configure,
        },
    ],
    exports: [CONFIGURATION_TOKEN, CONFIGURATION_SERVICE_TOKEN],
})
@Module({})
export class ConfigHostModule {}
