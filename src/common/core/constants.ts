import chalk from 'chalk';
import { toNumber } from 'lodash';

import { Configure } from '../../common/config/configure';

import { echoApi } from '../restful/helpers';

import { getRandomCharString, toBoolean } from './helpers';
import { App } from './types';

/**
 * DTOValidation装饰器选项
 */
export const DTO_VALIDATION_OPTIONS = 'dto_validation_options';

/**
 * 默认应用配置
 * @param configure
 */
export const getDefaultAppConfig = (configure: Configure) => ({
    // 生产一个随机应用名
    name: getRandomCharString(9),
    host: configure.env.get('APP_HOST', '127.0.0.1'),
    port: configure.env.get('APP_PORT', (v) => toNumber(v), 3000),
    https: configure.env.get('APP_SSL', (v) => toBoolean(v), false),
    timezone: configure.env.get('APP_TIMEZONE', 'Asia/Shanghai'),
    locale: configure.env.get('APP_LOCALE', 'zh_CN'),
    fallbackLocale: configure.env.get('APP_FALLBACK_LOCALE', 'en'),
});

export const listened: (app: App, startTime: Date) => () => Promise<void> =
    ({ configure, container }, startTime) =>
    async () => {
        console.log();
        await echoApi(configure, container);
        console.log('used time:', chalk.cyan(`${new Date().getTime() - startTime.getTime()}`));
    };
