/* eslint-disable import/no-extraneous-dependencies */

import { StartOptions } from 'pm2';

export type Pm2Arguments = {
    /**
     * 使用直接运行TS文件的入口文件,默认为main.ts
     * 如果是运行js文件,则通过nest-cli.json的entryFile指定
     */
    entry?: string;

    /**
     * 是否监控,所有环境都可以使用(但在非PM2启动的生产环境下此选项无效)
     */
    watch?: boolean;

    /**
     * 是否重启应用(PM2进程)
     */
    restart?: boolean;

    /**
     * 是否执行额外命令
     */
    args?: string[];
};

/**
 * PM2配置
 */
export type Pm2Option = Pick<Pm2Arguments, 'watch' | 'args'> &
    Omit<StartOptions, 'name' | 'cwd' | 'script' | 'args' | 'interpreter' | 'watch'>;
