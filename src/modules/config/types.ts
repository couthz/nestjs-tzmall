import { Configure } from './configure';

/**
 * 存储配置选项
 */
export interface ConfigStorageOption {
    /**
     * 是否开启存储
     */
    enabled?: boolean;
    /**
     * yaml文件路径,默认为dist目录外的config.yaml
     */
    filePath?: string;
}

/**
 * 配置注册器函数
 */
export type ConfigureRegister<T extends Record<string, any>> = (
    configure: Configure,
) => T | Promise<T>;

/**
 * 配置构造器
 */
export interface ConfigureFactory<
    T extends Record<string, any>,
    C extends Record<string, any> = T,
> {
    /**
     * 配置注册器
     */
    register: ConfigureRegister<RePartial<T>>;
    /**
     * 默认配置注册器
     */
    defaultRegister?: ConfigureRegister<T>;
    /**
     * 是否存储该配置
     */
    storage?: boolean;
    /**
     * 回调函数
     * @param configure 配置类服务实例
     * @param value 配置注册器register执行后的返回值
     */
    hook?: (configure: Configure, value: T) => C | Promise<C>;
    /**
     * 深度合并时是否对数组采用追加模式,默认 false
     */
    append?: boolean;
}

/**
 * 多连接连接型配置
 */
export type ConnectionOption<T extends Record<string, any>> = { name?: string } & T;
/**
 * 多连接连接型配置生成的结果
 */
export type ConnectionRst<T extends Record<string, any>> = Array<{ name: string } & T>;
