/**
 * 数据库配置
 */

import { TypeOrmModuleOptions } from '@nestjs/typeorm';

export const database = (): TypeOrmModuleOptions => ({
    // 以下为mysql配置
    charset: 'utf8mb4',
    logging: ['error'],
    type: 'mysql',
    host: '127.0.0.1',
    port: 3306,
    username: 'root',
    password: '12345678',
    database: '3r',
    // 以下为sqlite配置
    // type: 'better-sqlite3',
    // database: resolve(__dirname, '../../database.db'),
    synchronize: true,
    autoLoadEntities: true,
});
