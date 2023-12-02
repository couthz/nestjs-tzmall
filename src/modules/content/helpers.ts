import { ConfigureFactory, ConfigureRegister } from '../config/types';
import { RouteOption, TagOption } from '../restful/types';

import * as controllers from './controllers';
import { ContentConfig } from './types';

export const defaultContentConfig: ContentConfig = { searchType: 'against', htmlEnabled: false };
export const createContentConfig: (
    register: ConfigureRegister<RePartial<ContentConfig>>,
) => ConfigureFactory<ContentConfig> = (register) => ({
    register,
    defaultRegister: () => defaultContentConfig,
});

export const createContentApi = () => {
    const routes: Record<'app', RouteOption[]> = {
        app: [
            {
                name: 'app.content',
                path: 'content',
                controllers: Object.values(controllers),
            },
        ],
    };
    const tags: Record<'app', (string | TagOption)[]> = {
        app: [
            { name: '分类操作', description: '对分类的增删查操作' },
            { name: '标签操作', description: '对标签的增删查操作' },
            { name: '文章操作', description: '对文章进行的增删查改及搜索等操作' },
            { name: '评论操作', description: '对评论的增删查操作' },
        ],
    };
    return { routes, tags };
};
