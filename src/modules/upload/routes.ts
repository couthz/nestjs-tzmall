import { RouteOption, TagOption } from '../restful/types';

import * as controllers from './controllers';
import * as adminControllers from './controllers/admin';

export const createUploadApi = () => {
    const routes: Record<'app' | 'admin', RouteOption[]> = {
        app: [
            {
                name: 'app.upload',
                path: 'upload',
                controllers: Object.values(controllers),
            },
        ],
        admin: [
            {
                name: 'admin.upload',
                path: 'upload',
                controllers: Object.values(adminControllers),
            },
        ],
    };
    const tags: Record<'app' | 'admin', Array<string | TagOption>> = {
        app: [{ name: '上传管理', description: '上传管理' }],
        admin: [
            { name: '上传管理', description: '上传管理' },
            // { name: '权限信息', description: '查看权限信息' },
        ],
    };
    return { routes, tags };
};
