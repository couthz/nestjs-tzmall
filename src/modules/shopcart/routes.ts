import { RouteOption, TagOption } from '../restful/types';

import * as controllers from './controllers';
// import * as manageControllers from './controllers/manage';

export const createShopcartApi = () => {
    const routes: Record<'app' | 'admin', RouteOption[]> = {
        app: [
            {
                name: 'app.shopcart',
                path: 'shopcart',
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
        app: [{ name: '购物车管理', description: '查询购物车信息' }],
        admin: [
            // { name: '角色管理', description: '管理角色信息' },
            // { name: '权限信息', description: '查看权限信息' },
        ],
    };
    return { routes, tags };
};
