import { RouteOption, TagOption } from '../restful/types';

import * as controllers from './controllers';
import * as manageControllers from './controllers/manage';

export const createUserApi = () => {
    const routes: Record<'app' | 'manage', RouteOption[]> = {
        app: [
            {
                name: 'app.user',
                path: 'user',
                controllers: Object.values(controllers),
            },
        ],
        manage: [
            {
                name: 'manage.user',
                path: 'user',
                controllers: Object.values(manageControllers),
            },
        ],
    };
    const tags: Record<'app' | 'manage', (string | TagOption)[]> = {
        app: [
            { name: '用户信息', description: '查看用户信息' },
            { name: '认证操作', description: '注册、登录、找回密码等' },
            { name: '账户操作', description: '查看修改账户信息、修改密码等' },
        ],
        manage: [{ name: '用户管理', description: '用户的增删查改操作' }],
    };
    return { routes, tags };
};
