/**
 * 数据库配置
 */

import { createDbConfig } from '@/modules/database/helpers';

export const database = createDbConfig((configure) => ({
    common: {
        // synchronize: true,
    },
    connections: [
        {
            // 以下为mysql配置
            type: 'mysql',
            host: process.env.MYSQL_HOST,
            port: parseInt(process.env.MYSQL_PORT,10),
            username: process.env.MYSQL_USERNAME,
            password: process.env.MYSQL_PASSWORD,
            database: process.env.MYSQL_DATABASE,
            timezone: "+08:00",
        },
        // {
        // 以下为sqlite配置
        // type: 'better-sqlite3',
        // database: resolve(__dirname, '../../database.db'),
        // },
    ],
}));
