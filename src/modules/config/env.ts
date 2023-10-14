import { readFileSync } from 'fs';

import { parse } from 'dotenv';
import findUp from 'find-up';
import { isFunction, isNil } from 'lodash';

import { EnvironmentType } from './constants';

/**
 * 环境变量操作类
 */
export class Env {
    /**
     * 加载环境变量
     */
    async load() {
        /**
         * 默认在开发环境运行
         */
        if (isNil(process.env.NODE_ENV)) process.env.NODE_ENV = EnvironmentType.DEVELOPMENT;
        // 从当前运行应用的目录开始,向上查找.env文件,直到找到第一个文件为止
        // 没有找到则返回undefined
        const search = [findUp.sync(['.env'])];
        // 从当前运行应用的目录开始,向上寻找.env.{环境变量文件},直到找到第一个文件为止,如.env.local
        // 如果是development、dev、production、prod环境则同时查找两个
        // 没有找到则返回undefined
        // eslint-disable-next-line @typescript-eslint/no-unsafe-enum-comparison
        if (this.isDev()) {
            search.push(
                findUp.sync([`.env.${EnvironmentType.DEVELOPMENT}`, `.env.${EnvironmentType.DEV}`]),
            );
        } else if (this.isProd()) {
            search.push(
                findUp.sync([`.env.${EnvironmentType.PRODUCTION}`, `.env.${EnvironmentType.PROD}`]),
            );
        } else {
            search.push(findUp.sync([`.env.${this.run()}`]));
        }
        // 过滤掉undefined,把找到的环境变量文件放入envFiles数组
        const envFiles = search.filter((file) => file !== undefined) as string[];
        // 转义每个环境变量文件中的内容为一个对象并让前者覆盖合并后者
        // 如.env.{环境变量文件}会覆盖合并.env
        // 然后,得到所有文件中配置的环境变量对象
        const fileEnvs = envFiles
            .map((filePath) => parse(readFileSync(filePath)))
            .reduce(
                (oc, nc) => ({
                    ...oc,
                    ...nc,
                }),
                {},
            );
        // 文件环境变量与系统环境变量合并
        const envs = { ...process.env, ...fileEnvs };
        // 过滤出在envs中存在而在process.env中不存在的键
        const keys = Object.keys(envs).filter((key) => !(key in process.env));
        // 把.env*中存在而系统环境变量中不存在的键值对追加到process.env中
        // 这样就可以得到最终环境变量 process.env
        keys.forEach((key) => {
            process.env[key] = envs[key];
        });
    }

    /**
     * 当前运行环境,如果production, development等
     */
    run() {
        return process.env.NODE_ENV as EnvironmentType & RecordAny;
    }

    /**
     * 是否在生产环境运行
     */
    isProd() {
        return this.run() === EnvironmentType.PRODUCTION || this.run() === EnvironmentType.PROD;
    }

    /**
     * 是否在开发环境运行
     */
    isDev() {
        return this.run() === EnvironmentType.DEVELOPMENT || this.run() === EnvironmentType.DEV;
    }

    /**
     * 获取全部环境变量
     */
    get(): { [key: string]: string };

    /**
     * 直接获取环境变量
     * @param key
     */
    get<T extends BaseType = string>(key: string): T;

    /**
     * 获取类型转义后的环境变量
     * @param key
     * @param parseTo 类型转义函数
     */
    get<T extends BaseType = string>(key: string, parseTo: ParseType<T>): T;

    /**
     * 获取环境变量,不存在则获取默认值
     * @param key
     * @param defaultValue 默认值
     */
    get<T extends BaseType = string>(key: string, defaultValue: T): T;

    /**
     * 获取类型转义后的环境变量,不存在则获取默认值
     * @param key
     * @param parseTo 类型转义函数
     * @param defaultValue 默认值
     */
    get<T extends BaseType = string>(key: string, parseTo: ParseType<T>, defaultValue: T): T;

    /**
     * 获取环境变量
     * @param key
     * @param parseTo 类型转义函数
     * @param defaultValue 默认值
     */
    get<T extends BaseType = string>(key?: string, parseTo?: ParseType<T> | T, defaultValue?: T) {
        if (!key) return process.env;
        const value = process.env[key];
        if (value !== undefined) {
            if (parseTo && isFunction(parseTo)) {
                return parseTo(value);
            }
            return value as T;
        }
        if (parseTo === undefined && defaultValue === undefined) {
            return undefined;
        }
        if (parseTo && defaultValue === undefined) {
            return isFunction(parseTo) ? undefined : parseTo;
        }
        return defaultValue! as T;
    }
}
