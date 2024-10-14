/**
 * 统一错误代码定义
 */
export const ErrorCodeMap = {
  // 10000业务操作错误
  10000: '',
  // token相关
  11001: '登录无效或无权限访问',
  
} as const;

export type ErrorCodeMapType = keyof typeof ErrorCodeMap;
