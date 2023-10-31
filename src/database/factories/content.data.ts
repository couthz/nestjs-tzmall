export interface PostData {
    title: string;
    contentFile: string;
    summary?: string;
    category?: string;
    tags?: string[];
}

export interface CategoryData {
    name: string;
    children?: CategoryData[];
}

export interface TagData {
    name: string;
}

export interface ContentConfig {
    fixture?: {
        categories: CategoryData[];
        posts: PostData[];
    };
}

export const posts: PostData[] = [
    {
        title: '基于角色和属性的Node.js访问控制',
        contentFile: 'rbac.md',
        category: '后端',
        tags: ['node'],
    },
    {
        title: 'docker简介',
        contentFile: 'docker-introduce.md',
        category: '运维',
        tags: ['devops'],
    },
    {
        title: 'go协程入门',
        contentFile: 'goroutings.md',
        category: '后端',
        tags: ['go'],
    },
    {
        title: '基于lerna.js构建monorepo',
        contentFile: 'lerna.md',
        category: '后端',
        tags: ['ts'],
    },
    {
        title: '通过PHP理解IOC编程',
        contentFile: 'php-di.md',
        category: '后端',
        tags: ['php'],
    },
    {
        title: '玩转React Hooks',
        contentFile: 'react-hooks.md',
        category: '前端',
        tags: ['react'],
    },
    {
        title: 'TypeORM fixtures cli中文说明',
        contentFile: 'typeorm-fixtures-cli.md',
        category: '后端',
        tags: ['ts', 'node'],
    },
    {
        title: '使用yargs构建node命令行(翻译)',
        contentFile: 'yargs.md',
        category: '后端',
        tags: ['ts', 'node'],
    },
    {
        title: 'Typescript装饰器详解',
        summary:
            '装饰器用于给类,方法,属性以及方法参数等增加一些附属功能而不影响其原有特性。其在Typescript应用中的主要作用类似于Java中的注解,在AOP(面向切面编程)使用场景下非常有用',
        contentFile: 'typescript-decorator.md',
        category: '基础',
        tags: ['ts'],
    },
];

export const categories: CategoryData[] = [
    {
        name: '技术文档',
        children: [
            {
                name: '基础',
            },
            {
                name: '前端',
            },
            {
                name: '后端',
            },
            {
                name: '运维',
            },
        ],
    },
    {
        name: '随笔记忆',
        children: [
            {
                name: '工作历程',
            },
            {
                name: '网站收藏',
            },
        ],
    },
];

export const tags: TagData[] = [
    {
        name: 'ts',
    },
    {
        name: 'react',
    },
    {
        name: 'node',
    },
    {
        name: 'go',
    },
    {
        name: 'php',
    },
    {
        name: 'devops',
    },
];
