import { RouteOption, TagOption } from '../restful/types';

import * as controllers from './controllers';
import * as adminControllers from './controllers/admin';

export const createOrderApi = () => {
    const routes: Record<'app' | 'admin', RouteOption[]> = {
        app: [
            {
                name: 'app.order',
                path: 'order',
                controllers: Object.values(controllers),
            },
        ],
        admin: [
            {
                name: 'admin.order',
                path: 'order',
                controllers: Object.values(adminControllers),
            },
        ],
    };
    const tags: Record<'app' | 'admin', Array<string | TagOption>> = {
        app: [{ name: '订单管理', description: '查询订单信息' },
        { name: '支付管理', description: '支付管理' }],
        admin: [
            { name: '订单管理', description: '查询订单信息' },
            { name: '卖家地址管理', description: '查看卖家地址' },
        ],
    };
    return { routes, tags };
};
