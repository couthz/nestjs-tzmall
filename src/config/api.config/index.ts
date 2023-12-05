import { Configure } from '@/common/config/configure';
import { ConfigureFactory } from '@/common/config/types';
import { ApiConfig } from '@/common/restful/types';

import { v1 } from './v1';

export const api: ConfigureFactory<ApiConfig> = {
    register: async (configure: Configure) => ({
        title: configure.env.get('API_TITLE', '3R教室'),
        description: configure.env.get('API_DESCRIPTION', '3R教室TS全栈开发教程'),
        auth: true,
        docuri: 'api/docs',
        default: configure.env.get('API_DEFAULT_VERSION', 'v1'),
        enabled: [],
        versions: { v1: await v1(configure) },
    }),
};
