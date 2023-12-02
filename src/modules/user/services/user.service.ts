import { Injectable } from '@nestjs/common';
import { EntityNotFoundError, SelectQueryBuilder, DataSource } from 'typeorm';

import { Configure } from '@/modules/config/configure';
import { BaseService } from '@/modules/database/base';
import { QueryHook } from '@/modules/database/types';

import { CreateUserDto, QueryUserDto, UpdateUserDto } from '../dtos/user.dto';
import { UserEntity } from '../entities/user.entity';
import { UserRepository } from '../repositories/user.repository';

/**
 * 用户管理服务
 */
@Injectable()
export class UserService extends BaseService<UserEntity, UserRepository> {
    protected enable_trash = true;

    constructor(
        protected configure: Configure,
        protected userRepository: UserRepository,
        protected dataSource: DataSource,
    ) {
        super(userRepository);
    }

    /**
     * 创建用户
     * @param data
     */
    async create(data: CreateUserDto) {
        const user = await this.userRepository.save(data, { reload: true });
        return this.detail(user.id);
    }

    /**
     * 更新用户
     * @param data
     */
    async update(data: UpdateUserDto) {
        const user = await this.userRepository.save(data, { reload: true });
        return this.detail(user.id);
    }

    /**
     * 根据用户用户凭证查询用户
     * @param credential
     * @param callback
     */
    async findOneByCredential(credential: string, callback?: QueryHook<UserEntity>) {
        let query = this.userRepository.buildBaseQuery();
        if (callback) {
            query = await callback(query);
        }
        return query
            .where('user.username = :credential', { credential })
            .orWhere('user.email = :credential', { credential })
            .orWhere('user.phone = :credential', { credential })
            .getOne();
    }

    /**
     * 根据对象条件查找用户,不存在则抛出异常
     * @param condition
     * @param callback
     */
    async findOneByCondition(condition: { [key: string]: any }, callback?: QueryHook<UserEntity>) {
        let query = this.userRepository.buildBaseQuery();
        if (callback) {
            query = await callback(query);
        }
        const wheres = Object.fromEntries(
            Object.entries(condition).map(([key, value]) => [key, value]),
        );
        const user = query.where(wheres).getOne();
        if (!user) {
            throw new EntityNotFoundError(UserEntity, Object.keys(condition).join(','));
        }
        return user;
    }

    protected async buildListQB(
        queryBuilder: SelectQueryBuilder<UserEntity>,
        options: QueryUserDto,
        callback?: QueryHook<UserEntity>,
    ) {
        const { orderBy } = options;
        const qb = await super.buildListQB(queryBuilder, options, callback);
        if (orderBy) qb.orderBy(`user.${orderBy}`, 'ASC');
        return qb;
    }
}
