import { RouteOption, TagOption } from '../restful/types';

import * as controllers from './controllers';
import * as manageControllers from './controllers/manage';

export const createContentApi = () => {
    const routes: Record<'app' | 'manage', RouteOption[]> = {
        app: [
            {
                name: 'app.content',
                path: 'content',
                controllers: Object.values(controllers),
            },
        ],
        manage: [
            {
                name: 'manage.content',
                path: 'content',
                controllers: Object.values(manageControllers),
            },
        ],
    };
    const tags: Record<'app' | 'manage', Array<string | TagOption>> = {
        app: [
            { name: '分类信息', description: '查询分类信息' },
            { name: '标签信息', description: '查询标签信息' },
            {
                name: '文章操作',
                description: '查询文章以及对自己的文章进行CRUD操作',
            },
            {
                name: '评论操作',
                description: '查看评论以及对自己的评论进行CRD操作',
            },
        ],
        manage: [
            { name: '分类管理', description: '对分类进行CRUD操作' },
            { name: '标签管理', description: '对标签进行CRUD操作' },
            { name: '文章管理', description: '对文章进行CRUD操作' },
            { name: '评论管理', description: '对评论进行CRUD操作' },
        ],
    };
    return { routes, tags };
};
