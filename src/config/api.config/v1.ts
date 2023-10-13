import { Configure } from '@/modules/config/configure';
import * as contentControllers from '@/modules/content/controllers';
import { VersionOption } from '@/modules/restful/types';

export const v1 = async (configure: Configure): Promise<VersionOption> => ({
    routes: [
        {
            name: 'app',
            path: '/',
            controllers: [],
            doc: {
                title: '应用接口',
                description: '前端APP应用接口',
                tags: [
                    { name: '分类操作', description: '对分类的增删查操作' },
                    { name: '标签操作', description: '对标签的增删查操作' },
                    { name: '文章操作', description: '对文章进行的增删查改及搜索等操作' },
                    { name: '评论操作', description: '对评论的增删查操作' },
                ],
            },
            children: [
                {
                    name: 'content',
                    path: 'content',
                    controllers: Object.values(contentControllers),
                },
            ],
        },
    ],
});
