import { Configure } from '@/modules/config/configure';
import { createContentApi } from '@/modules/content/helpers';
import { VersionOption } from '@/modules/restful/types';
import { createUserApi } from '@/modules/user/helpers';

export const v1 = async (configure: Configure): Promise<VersionOption> => {
    const userApi = createUserApi();
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
                    tags: [...contentApi.tags.app, ...userApi.tags.app],
                },
                children: [...contentApi.routes.app, ...userApi.routes.app],
            },
        ],
    };
};
