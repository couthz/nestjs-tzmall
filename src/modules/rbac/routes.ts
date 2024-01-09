import { RouteOption, TagOption } from '../restful/types';

import * as controllers from './controllers';
import * as manageControllers from './controllers/manage';

export const createRbacApi = () => {
    const routes: Record<'app' | 'manage', RouteOption[]> = {
        app: [
            {
                name: 'app.rbac',
                path: 'rbac',
                controllers: Object.values(controllers),
            },
        ],
        manage: [
            {
                name: 'manage.rbac',
                path: 'rbac',
                controllers: Object.values(manageControllers),
            },
        ],
    };
    const tags: Record<'app' | 'manage', Array<string | TagOption>> = {
        app: [{ name: '角色管理', description: '查询角色信息' }],
        manage: [
            { name: '角色管理', description: '管理角色信息' },
            { name: '权限信息', description: '查看权限信息' },
        ],
    };
    return { routes, tags };
};
