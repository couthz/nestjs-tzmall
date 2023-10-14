/**
 * 预定义的运行环境
 * 除了production必定用于生产环境外
 * 其余均不强制,可以增加自定义,如果local
 */
export enum EnvironmentType {
    DEVELOPMENT = 'development',
    DEV = 'dev',
    PRODUCTION = 'production',
    PROD = 'prod',
    TEST = 'test',
    PREVIEW = 'preview',
}
