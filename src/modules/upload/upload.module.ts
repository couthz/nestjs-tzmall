import {  ModuleMetadata } from '@nestjs/common';

import { Configure } from '../config/configure';
import * as services from './services';

export class UploadModule {
  static async forRoot(configure: Configure) {
    const providers: ModuleMetadata['providers'] = [...Object.values(services)];
    return {
        module: UploadModule,
        providers,
        exports: [...Object.values(services),],
    };
}
}


