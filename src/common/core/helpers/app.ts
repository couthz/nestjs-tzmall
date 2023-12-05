import { BadGatewayException, Global, Module, ModuleMetadata, Type } from '@nestjs/common';
import { APP_FILTER, APP_GUARD, APP_INTERCEPTOR, APP_PIPE } from '@nestjs/core';
import { useContainer } from 'class-validator';

import { isNil, omit } from 'lodash';

import { ConfigModule } from '@/common/config/config.module';
import { Configure } from '@/common/config/configure';

import { ConfigureFactory, ConfigureRegister } from '@/common/config/types';

import { getDefaultAppConfig } from '../constants';
import { CoreModule } from '../core.module';
import { ApiExceptionFilter, AppInterceptor,ApiTransformInterceptor,AppPipe } from '../providers';
import { App, AppConfig, CreateOptions } from '../types';

import { createCommands } from './command';
import { CreateModule } from './utils';
import { AuthGuard } from '../guards/auth.guard';

// app实例常量
export const app: App = { configure: new Configure(), commands: [] };

/**
 * 创建一个应用
 * @param options 创建选项
 */
export const createApp = (options: CreateOptions) => async (): Promise<App> => {
    const { config, builder } = options;
    // 初始化配置实例
    await app.configure.initilize(config.factories, config.storage);
    // 如果没有app配置则使用默认配置
    if (!app.configure.has('app')) {
        throw new BadGatewayException('App config not exists!');
    }
    // 创建启动模块
    const BootModule = await createBootModule(app.configure, options);
    // 创建app的容器实例
    app.container = await builder({
        configure: app.configure,
        BootModule,
    });
    // 设置api前缀
    // if (app.configure.has('app.prefix')) {
    //     app.container.setGlobalPrefix(await app.configure.get<string>('app.prefix'));
    // }
    // 为class-validator添加容器以便在自定义约束中可以注入dataSource等依赖
    useContainer(app.container.select(BootModule), {
        fallbackOnErrors: true,
    });
    app.commands = await createCommands(options.commands, app as Required<App>);
    return app;
};

/**
 * 构建一个启动模块
 * @param params
 * @param options
 */
export async function createBootModule(
    configure: Configure,
    options: Pick<CreateOptions, 'globals' | 'modules'>,
): Promise<Type<any>> {
    const { globals = {} } = options;
    // 获取需要导入的模块
    const modules = await options.modules(configure);
    const imports: ModuleMetadata['imports'] = (
        await Promise.all([
            ...modules,
            ConfigModule.forRoot(configure),
            await CoreModule.forRoot(configure),
        ])
    ).map((item) => {
        if ('module' in item) {
            const meta = omit(item, ['module', 'global']);
            Module(meta)(item.module);
            if (item.global) Global()(item.module);
            return item.module;
        }
        return item;
    });
    // 配置全局提供者
    const providers: ModuleMetadata['providers'] = [];
    if (globals.pipe !== null) {
        const pipe = globals.pipe
            ? globals.pipe(configure)
            : new AppPipe();
        providers.push({
            provide: APP_PIPE,
            useValue: pipe,
        });
    }
    if (globals.interceptor !== null) {
        providers.push({
            provide: APP_INTERCEPTOR,
            useClass: globals.interceptor ?? AppInterceptor,
        });
        providers.push({
            provide: APP_INTERCEPTOR,
            useClass: globals.interceptor ?? ApiTransformInterceptor,
        });
    }
    if (globals.filter !== null) {
        providers.push({
            provide: APP_FILTER,
            useClass: ApiExceptionFilter,
        });
        
    }
    providers.push({
        provide: APP_GUARD,
        useClass: AuthGuard,
    })
    

    return CreateModule('BootModule', () => {
        const meta: ModuleMetadata = {
            imports,
            providers,
        };
        return meta;
    });
}

/**
 * 应用配置工厂
 */
export const createAppConfig: (
    register: ConfigureRegister<RePartial<AppConfig>>,
) => ConfigureFactory<AppConfig> = (register) => ({
    register,
    defaultRegister: (configure) => getDefaultAppConfig(configure),
    hook: (configure: Configure, value) => {
        if (isNil(value.url))
            value.url = `${value.https ? 'https' : 'http'}://${value.host}:${value.port}`;
        return value;
    },
});

/**
 * 构建APP CLI,默认start命令应用启动监听app
 * @param creator APP构建器
 * @param listened 监听回调
 */
export async function startApp(
    creator: () => Promise<App>,
    listened?: (app: App, startTime: Date) => () => Promise<void>,
) {
    const startTime = new Date();
    const { container, configure, commands } = await creator();
    app.commands = commands;
    app.container = container;
    app.configure = configure;
    const { port, host } = await configure.get<AppConfig>('app');
    await container.listen(port, host, listened(app, startTime));
}
