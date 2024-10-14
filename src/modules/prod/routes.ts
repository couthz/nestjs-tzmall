import { RouteOption, TagOption } from '../restful/types';

import * as controllers from './controllers';
 import * as adminControllers from './controllers/admin';

export const createProdApi = () => {
    const routes: Record<'app' | 'admin', RouteOption[]> = {
        app: [
            {
                name: 'app.prod',
                path: 'prod',
                controllers: Object.values(controllers),
            },
        ],
        admin: [
            {
                name: 'admin.prod',
                path: 'prod',
                controllers: Object.values(adminControllers),
            },
        ],
    };
    const tags: Record<'app' | 'admin', Array<string | TagOption>> = {
        app: [{ name: '商品管理', description: '查询商品信息' },
        { name: '商品标签管理', description: '商品标签管理' },
        { name: '商品分类管理', description: '商品分类管理' }],
        admin: [
            { name: '商品管理', description: '商品管理' },
        ],
    };
    return { routes, tags };
};
