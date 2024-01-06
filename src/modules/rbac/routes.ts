import { RouteOption, TagOption } from '../restful/types';

import * as controllers from './controllers';

export const createRbacApi = () => {
    const routes: RouteOption[] = [
        {
            name: 'app.rbac',
            path: 'rbac',
            controllers: Object.values(controllers),
        },
    ];
    const tags: (string | TagOption)[] = [
        { name: '角色管理', description: '管理角色信息' },
        { name: '权限信息', description: '查看权限信息' },
    ];

    return { routes, tags };
};
