import { RouteOption, TagOption } from '../restful/types';

import * as controllers from './controllers';

export const createUserApi = () => {
    const routes: RouteOption[] = [
        {
            name: 'app.user',
            path: 'user',
            controllers: Object.values(controllers),
        },
    ];
    const tags: (string | TagOption)[] = [
        { name: '用户管理', description: '管理用户信息' },
        { name: '认证操作', description: '注册、登录、找回密码等' },
        { name: '账户操作', description: '查看修改账户信息、修改密码等' },
    ];
    return { routes, tags };
};
