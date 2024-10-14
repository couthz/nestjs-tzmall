import { RouteOption, TagOption } from '../restful/types';

import * as controllers from './controllers';
// import * as manageControllers from './controllers/manage';

export const createUserApi = () => {
    const routes: Record<'app' | 'admin', RouteOption[]> = {
        app: [
            {
                name: 'app.user',
                path: 'user',
                controllers: Object.values(controllers),
            },
        ],
        admin: [
            // {
            //     name: 'admin.rbac',
            //     path: 'rbac',
            //     controllers: Object.values(manageControllers),
            // },
        ],
    };
    const tags: Record<'app' | 'admin', Array<string | TagOption>> = {
        app: [{ name: '用户认证管理', description: '用户认证相关操作' }],
        admin: [
            // { name: '角色管理', description: '管理角色信息' },
            // { name: '权限信息', description: '查看权限信息' },
        ],
    };
    return { routes, tags };
};
