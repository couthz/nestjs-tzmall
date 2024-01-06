import { RouteOption, TagOption } from '../restful/types';

import * as controllers from './controllers';

export const createContentApi = () => {
    const routes: RouteOption[] = [
        {
            name: 'app.content',
            path: 'content',
            controllers: Object.values(controllers),
        },
    ];
    const tags: (string | TagOption)[] = [
        { name: '分类操作', description: '分类的CRUD操作' },
        { name: '标签操作', description: '标签的CRUD操作' },
        { name: '文章操作', description: '查看文章、对自己的文章或者作为管理员对文章进行CRUD操作' },
        { name: '评论操作', description: '查看评论和对自己的评论或者作为管理对评论进行增删查操作' },
    ];
    return { routes, tags };
};
