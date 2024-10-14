import { RouteOption, TagOption } from '../restful/types';
import * as controllers from './controllers';

import * as adminControllers from './controllers/admin';

export const createAreaApi = () => {
    const routes: Record<'app' | 'admin', RouteOption[]> = {
        app: [
            {
                name: 'app.area',
                path: 'area',
                controllers: Object.values(controllers),
            },
        ],
        admin: [
            {
                name: 'admin.area',
                path: 'area',
                controllers: Object.values(adminControllers),
            },
        ],
    };
    const tags: Record<'app' | 'admin', Array<string | TagOption>> = {
        app: [{ name: '省市区管理', description: '查询省市区信息' }],
        admin: [
            { name: '省市区管理', description: '管理省市区信息' },
            // { name: '权限信息', description: '查看权限信息' },
        ],
    };
    return { routes, tags };
};
