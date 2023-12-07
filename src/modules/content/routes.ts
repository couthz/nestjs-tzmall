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
    const tags: Record<'app' | 'manage', (string | TagOption)[]> = {
        app: [
            { name: '分类信息', description: '查看分类信息' },
            { name: '标签信息', description: '查看标签信息' },
            { name: '文章操作', description: '查看文章和对自己的文章进行增删改查操作' },
            { name: '评论操作', description: '查看评论和对自己的评论进行增删查操作' },
        ],
        manage: [
            { name: '分类管理', description: '对分类的增删查操作' },
            { name: '标签管理', description: '对标签的增删查操作' },
            { name: '文章管理', description: '对文章进行的增删查改及搜索等操作' },
            { name: '评论管理', description: '对评论的增删查操作' },
        ],
    };
    return { routes, tags };
};
