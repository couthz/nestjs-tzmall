/**
 * 用户模块配置
 */
export interface UserConfig {
    hash: number;
    jwt: JwtConfig;
}

/**
 * JWT配置
 */
export interface JwtConfig {
    token_expired: number;
    refresh_token_expired: number;
}

/**
 * JWT荷载对象类型
 */
export interface JwtPayload {
    sub: string;
    iat: number;
}
