import { createAreaApi } from '@/modules/area/routes';
import { Configure } from '@/modules/config/configure';
import { ConfigureFactory } from '@/modules/config/types';
import { createOrderApi } from '@/modules/order/routes';
import { createProdApi } from '@/modules/prod/routes';

import { ApiConfig, VersionOption } from '@/modules/restful/types';
import { createShopcartApi } from '@/modules/shopcart/routes';
import { createUploadApi } from '@/modules/upload/routes';
import { createUserApi } from '@/modules/user/routes';

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

export const v1 = async (configure: Configure): Promise<VersionOption> => {
    const userApi = createUserApi();
    const orderApi = createOrderApi();
    const prodApi = createProdApi();
    const shopcartApi = createShopcartApi();
    const uploadApi = createUploadApi();
    const areaApi = createAreaApi();
    return {
        routes: [
            {
                name: 'app',
                path: '/',
                controllers: [],
                doc: {
                    title: '应用接口',
                    description: '客户端接口',
                    tags: [ ...userApi.tags.app, ...orderApi.tags.app, ...prodApi.tags.app, ...shopcartApi.tags.app, ...uploadApi.tags.app, ...areaApi.tags.app],
                },
                children: [ ...userApi.routes.app, ...orderApi.routes.app, ...prodApi.routes.app, ...shopcartApi.routes.app, ...uploadApi.routes.app, ...areaApi.routes.app],
            },
            {
                name: 'admin',
                path: 'admin',
                controllers: [],
                doc: {
                    title: '管理端接口',
                    description: '应用的后台管理接口',
                    tags: [

                        ...userApi.tags.admin,
                        ...orderApi.tags.admin,
                        ...prodApi.tags.admin,
                        ...shopcartApi.tags.admin,
                        ...uploadApi.tags.admin,
                        ...areaApi.tags.admin,
                    ],
                },
                children: [
                    ...userApi.routes.admin,
                    ...orderApi.routes.admin,
                    ...prodApi.routes.admin,
                    ...shopcartApi.routes.admin,
                    ...uploadApi.routes.admin,
                    ...areaApi.routes.admin,
                ],
            },
        ],
    };
};
