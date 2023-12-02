/**
 * 用户列表查询排序方式
 */
export enum UserOrderType {
    CREATED = 'createdAt',
    UPDATED = 'updatedAt',
}

/**
 * 用户请求DTO验证组
 */
export enum UserValidateGroups {
    CREATE = 'user-create',
    UPDATE = 'user-update',
    REGISTER = 'user-register',
}

export const ALLOW_GUEST = 'allowGuest';
