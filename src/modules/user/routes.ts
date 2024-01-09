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
    const tags: Record<'app' | 'manage', Array<string | TagOption>> = {
        app: [
            { name: '用户查询', description: '查看用户列表和用户信息' },
            { name: '账户操作', description: '注册、登录、找回密码、查看修改账户信息、修改密码等' },
        ],
        manage: [{ name: '用户管理', description: '管理用户信息' }],
    };
    return { routes, tags };
};
