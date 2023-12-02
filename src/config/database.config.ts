/**
 * 数据库配置
 */

import { ContentFactory } from '@/database/factories/content.factory';
import { UserFactory } from '@/database/factories/user.factory';
import ContentSeeder from '@/database/seeders/content.seeder';
import UserSeeder from '@/database/seeders/user.seeder';
import { createDbConfig } from '@/modules/database/helpers';

export const database = createDbConfig((configure) => ({
    common: {
        // synchronize: true,
    },
    connections: [
        {
            // 以下为mysql配置
            type: 'mysql',
            host: '127.0.0.1',
            port: 3306,
            username: 'root',
            password: '12345678',
            database: '3r',
            factories: [UserFactory, ContentFactory],
            seeders: [UserSeeder, ContentSeeder],
        },
        // {
        // 以下为sqlite配置
        // type: 'better-sqlite3',
        // database: resolve(__dirname, '../../database.db'),
        // },
    ],
}));
