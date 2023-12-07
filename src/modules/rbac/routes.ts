import { RouteOption, TagOption } from '../restful/types';

import * as controllers from './controllers';
import * as manageControllers from './controllers/ manage';

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
    const tags: Record<'app' | 'manage', (string | TagOption)[]> = {
        app: [{ name: '角色信息', description: '查看角色信息' }],
        manage: [
            { name: '权限管理', description: '权限的信息' },
            { name: '角色管理', description: '角色的增删查改' },
        ],
    };
    return { routes, tags };
};
