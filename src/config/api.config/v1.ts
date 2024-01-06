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
                    description: '客户端及管理端接口',
                    tags: [...contentApi.tags, ...userApi.tags, ...rbacApi.tags],
                },
                children: [...contentApi.routes, ...userApi.routes, ...rbacApi.routes],
            },
        ],
    };
};
