import { Configure } from '@/modules/config/configure';
import { createContentApi } from '@/modules/content/routes';
import { createRbacApi } from '@/modules/rbac/routes';
import { VersionOption } from '@/modules/restful/types';
import { createUserApi } from '@/modules/user/routes';

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
                    description: '前端APP应用接口',
                    tags: [...contentApi.tags.app, ...userApi.tags.app, ...rbacApi.tags.app],
                },
                children: [...contentApi.routes.app, ...userApi.routes.app, ...rbacApi.routes.app],
            },
            {
                name: 'manage',
                path: 'manage',
                controllers: [],
                doc: {
                    title: '后台接口',
                    description: '后台管理接口',
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
