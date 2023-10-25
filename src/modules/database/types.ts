import { TypeOrmModuleOptions } from '@nestjs/typeorm';
import {
    FindTreeOptions,
    ObjectLiteral,
    Repository,
    SelectQueryBuilder,
    TreeRepository,
} from 'typeorm';

import { Arguments } from 'yargs';

import { BaseRepository, BaseTreeRepository } from './base';
import { OrderType, SelectTrashMode } from './constants';

/**
 * 自定义数据库配置
 */
export type DbConfig = {
    common: Record<string, any> & DbAdditionalOption;
    connections: Array<TypeOrmModuleOptions & { name?: string } & DbAdditionalOption>;
};

/**
 * 最终数据库配置
 */
export type DbOptions = Record<string, any> & {
    common: Record<string, any>;
    connections: TypeormOption[];
};

/**
 * Typeorm连接配置
 */
export type TypeormOption = Omit<TypeOrmModuleOptions, 'name' | 'migrations'> & {
    name: string;
} & DbAdditionalOption;

export type QueryHook<Entity> = (
    qb: SelectQueryBuilder<Entity>,
) => Promise<SelectQueryBuilder<Entity>>;

/**
 * 分页原数据
 */
export interface PaginateMeta {
    /**
     * 当前页项目数量
     */
    itemCount: number;
    /**
     * 项目总数量
     */
    totalItems?: number;
    /**
     * 每页显示数量
     */
    perPage: number;
    /**
     * 总页数
     */
    totalPages?: number;
    /**
     * 当前页数
     */
    currentPage: number;
}
/**
 * 分页选项
 */
export interface PaginateOptions {
    /**
     * 当前页数
     */
    page?: number;
    /**
     * 每页显示数量
     */
    limit?: number;
}

/**
 * 分页返回数据
 */
export interface PaginateReturn<E extends ObjectLiteral> {
    meta: PaginateMeta;
    items: E[];
}

/**
 * 排序类型,{字段名称: 排序方法}
 * 如果多个值则传入数组即可
 * 排序方法不设置,默认DESC
 */
export type OrderQueryType =
    | string
    | { name: string; order: `${OrderType}` }
    | Array<{ name: string; order: `${OrderType}` } | string>;

/**
 * 数据列表查询类型
 */
export interface QueryParams<E extends ObjectLiteral> {
    addQuery?: QueryHook<E>;
    orderBy?: OrderQueryType;
    withTrashed?: boolean;
    onlyTrashed?: boolean;
}

/**
 * 服务类数据列表查询类型
 */
export type ServiceListQueryOption<E extends ObjectLiteral> =
    | ServiceListQueryOptionWithTrashed<E>
    | ServiceListQueryOptionNotWithTrashed<E>;

/**
 * 带有软删除的服务类数据列表查询类型
 */
type ServiceListQueryOptionWithTrashed<E extends ObjectLiteral> = Omit<
    FindTreeOptions & QueryParams<E>,
    'withTrashed'
> & {
    trashed?: `${SelectTrashMode}`;
} & Record<string, any>;

/**
 * 不带软删除的服务类数据列表查询类型
 */
type ServiceListQueryOptionNotWithTrashed<E extends ObjectLiteral> = Omit<
    ServiceListQueryOptionWithTrashed<E>,
    'trashed'
>;

// src/modules/database/types.ts
/**
 * Repository类型
 */
export type RepositoryType<E extends ObjectLiteral> =
    | Repository<E>
    | TreeRepository<E>
    | BaseRepository<E>
    | BaseTreeRepository<E>;

/**
 * 基础数据库命令参数类型
 */
export type TypeOrmArguments = Arguments<{
    connection?: string;
}>;

/**
 * 创建迁移命令参数
 */
export type MigrationCreateArguments = TypeOrmArguments & MigrationCreateOptions;

/**
 * 运行迁移的命令参数
 */
export type MigrationRunArguments = TypeOrmArguments & MigrationRunOptions;

/**
 * 生成迁移命令参数
 */
export type MigrationGenerateArguments = TypeOrmArguments & MigrationGenerateOptions;

/**
 * 恢复迁移的命令参数
 */
export type MigrationRevertArguments = TypeOrmArguments & MigrationRevertOptions;

/**
 * 创建迁移处理器选项
 */
export interface MigrationCreateOptions {
    name: string;
    // outputJs?: boolean;
}

/**
 * 生成迁移处理器选项
 */
export interface MigrationGenerateOptions {
    name?: string;
    run?: boolean;
    pretty?: boolean;
    // outputJs?: boolean;
    dryrun?: boolean;
    check?: boolean;
}

/**
 * 运行迁移处理器选项
 */
export interface MigrationRunOptions extends MigrationRevertOptions {
    refresh?: boolean;
    onlydrop?: boolean;
    clear?: boolean;
    seed?: boolean;
}

/**
 * 恢复迁移处理器选项
 */
export interface MigrationRevertOptions {
    transaction?: string;
    fake?: boolean;
}

/**
 * 额外数据库选项,用于CLI工具
 */
type DbAdditionalOption = {
    paths?: {
        /**
         * 迁移文件路径
         */
        migration?: string;
    };
};
