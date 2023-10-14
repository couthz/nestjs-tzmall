export type StartCommandArguments = {
    /**
     * 是否使用PM2后台静默启动
     */
    silence?: boolean;

    /**
     * 优先使用bun启动
     */
    bun?: boolean;

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
    debug?: boolean;

    /**
     * 在忘了设置环境变量时,用于手动判断是否处于生产环境
     */
    isProd?: boolean;
};

export type RestartCommandArguments = {
    /**
     * 使用restart模式强制重启整个应用
     */
    force?: boolean;
};

export type NestCommandArguments = {
    name: string;
    bun?: boolean;
    cmds?: string[];
};

export type Pm2ConfigParams = Pick<StartCommandArguments, 'bun' | 'typescript' | 'watch'> & {
    command: string;
};
