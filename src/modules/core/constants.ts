import { toNumber } from 'lodash';

import { Configure } from '../config/configure';

import { toBoolean } from './helpers';

/**
 * DTOValidation装饰器选项
 */
export const DTO_VALIDATION_OPTIONS = 'dto_validation_options';

/**
 * 默认应用配置
 * @param configure
 */
export const getDefaultAppConfig = (configure: Configure) => ({
    host: configure.env.get('APP_HOST', '127.0.0.1'),
    port: configure.env.get('APP_PORT', (v) => toNumber(v), 3000),
    https: configure.env.get('APP_SSL', (v) => toBoolean(v), false),
    timezone: configure.env.get('APP_TIMEZONE', 'Asia/Shanghai'),
    locale: configure.env.get('APP_LOCALE', 'zh-cn'),
});
