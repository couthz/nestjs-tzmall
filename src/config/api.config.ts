import { Configure } from '@/modules/config/configure';
import { ConfigureFactory } from '@/modules/config/types';

import { createContentApi } from '@/modules/content/routes';
import { createRbacApi } from '@/modules/rbac/routes';
import { ApiConfig, VersionOption } from '@/modules/restful/types';
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
    const rbacApi = createRbacApi();
    const contentApi = createContentApi();
    return {
        routes: [
            {
                name: 'app',
                path: '/',
                controllers: [],
                doc: {
                    title: '应用接口',
                    description: '客户端接口',
                    tags: [...contentApi.tags.app, ...userApi.tags.app, ...rbacApi.tags.app],
                },
                children: [...contentApi.routes.app, ...userApi.routes.app, ...rbacApi.routes.app],
            },
            {
                name: 'manage',
                path: 'manage',
                controllers: [],
                doc: {
                    title: '管理端接口',
                    description: '应用的后台管理接口',
                    tags: [
                        ...contentApi.tags.manage,
                        ...userApi.tags.manage,
                        ...rbacApi.tags.manage,
                    ],
                },
                children: [
                    ...contentApi.routes.manage,
                    ...userApi.routes.manage,
                    ...rbacApi.routes.manage,
                ],
            },
        ],
    };
};
