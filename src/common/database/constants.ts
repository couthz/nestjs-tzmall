export const CUSTOM_REPOSITORY_METADATA = 'CUSTOM_REPOSITORY_METADATA';
/**
 * 软删除数据查询类型
 */
export enum SelectTrashMode {
    /**
     * 全部数据
     */
    ALL = 'all',
    /**
     * 只查询回收站中的
     */
    ONLY = 'only',
    /**
     * 只查询没有被软删除的
     */
    NONE = 'none',
}

/**
 * 排序方式
 */
export enum OrderType {
    ASC = 'ASC',
    DESC = 'DESC',
}

/**
 * 树形模型在删除父级后子级的处理方式
 */
export enum TreeChildrenResolve {
    DELETE = 'delete',
    UP = 'up',
    ROOT = 'root',
}
