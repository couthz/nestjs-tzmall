/**
 * 数据库配置
 */

import { ContentFactory } from '@/database/factories/content.factory';
import ContentSeeder from '@/database/seeders/content.seeder';
import { createDbConfig } from '@/common/database/helpers';

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
            factories: [ContentFactory],
            seeders: [ContentSeeder],
        },
        // {
        // 以下为sqlite配置
        // type: 'better-sqlite3',
        // database: resolve(__dirname, '../../database.db'),
        // },
    ],
}));
