/* eslint-disable import/no-extraneous-dependencies */
import { SpawnOptions as NodeSpawnOptions } from 'child_process';

import { Configuration as NestCLIConfig } from '@nestjs/cli/lib/configuration';
import type { SpawnOptions as BunSpawnOptions } from 'bun';
import * as ts from 'typescript';

export type StartCommandArguments = {
    nestConfig?: string;
    tsConfig?: string;
    /**
     * 使用直接运行TS文件的入口文件,默认为main.ts
     * 如果是运行js文件,则通过nest-cli.json的entryFile指定
     */
    entry?: string;

    /**
     * 是否使用PM2后台静默启动生产环境
     */
    prod?: boolean;

    /**
     * 使用直接运行TS文件,这个配置只针对生产环境下是否通过
     */
    typescript?: boolean;

    /**
     * 是否监控,所有环境都可以使用(但在非PM2启动的生产环境下此选项无效)
     */
    watch?: boolean;

    /**
     * 是否开启debug模式,只对非生产环境有效
     */
    debug?: boolean | string;

    /**
     * 是否重启应用(PM2进程)
     */
    restart?: boolean;
};

export type BuildCommandArguments = Pick<StartCommandArguments, 'tsConfig' | 'nestConfig'> & {
    watch?: string;
    preserveWatchOutput?: boolean;
};

export type RestartCommandArguments = {
    /**
     * 使用restart模式强制重启整个应用
     */
    force?: boolean;
};

export type NestCommandArguments = {
    name: string;
    cmds?: string[];
};

export type Pm2ConfigParams = Pick<StartCommandArguments, 'typescript' | 'watch'> & {
    command: string;
};

/**
 * CLI运行配置
 */
export interface CLIConfig {
    options: {
        ts: ts.CompilerOptions;
        nest: NestCLIConfig;
    };
    paths: Record<'cwd' | 'dist' | 'src' | 'js' | 'ts' | 'bun' | 'nest', string>;
    subprocess: {
        bun: BunSpawnOptions.OptionsObject;
        node: NodeSpawnOptions;
    };
}
