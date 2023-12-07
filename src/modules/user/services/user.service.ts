import { Injectable } from '@nestjs/common';
import { isArray, isNil } from 'lodash';
import { EntityNotFoundError, SelectQueryBuilder, DataSource } from 'typeorm';

import { Configure } from '@/modules/config/configure';
import { BaseService } from '@/modules/database/base';
import { QueryHook } from '@/modules/database/types';

import { SystemRoles } from '@/modules/rbac/constants';

import { RoleRepository } from '@/modules/rbac/repositories';

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
        protected dataSource: DataSource,
        protected userRepository: UserRepository,
        protected roleRepository: RoleRepository,
    ) {
        super(userRepository);
    }

    /**
     * 创建用户
     * @param data
     */
    async create({ roles, permissions, ...data }: CreateUserDto) {
        const user = await this.userRepository.save(data, { reload: true });
        if (isArray(roles) && roles.length > 0) {
            await this.userRepository
                .createQueryBuilder('user')
                .relation('roles')
                .of(user)
                .add(roles);
        }
        if (isArray(permissions) && permissions.length > 0) {
            await this.userRepository
                .createQueryBuilder('user')
                .relation('permissions')
                .of(user)
                .add(permissions);
        }
        await this.syncRoles(await this.detail(user.id));
        return this.detail(user.id);
    }

    /**
     * 更新用户
     * @param data
     */
    async update({ roles, permissions, ...data }: UpdateUserDto) {
        const user = await this.userRepository.save(data, { reload: true });
        if (isArray(roles) && roles.length > 0) {
            await this.userRepository
                .createQueryBuilder('user')
                .relation('roles')
                .of(user)
                .addAndRemove(roles, user.roles ?? []);
        }
        if (isArray(permissions) && permissions.length > 0) {
            await this.userRepository
                .createQueryBuilder('user')
                .relation('permissions')
                .of(user)
                .addAndRemove(permissions, user.permissions ?? []);
        }
        await this.syncRoles(await this.detail(user.id));
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
        if (!isNil(options.role)) {
            qb.andWhere('roles.id IN (:...roles)', {
                roles: [options.role],
            });
        }
        if (!isNil(options.permission)) {
            qb.andWhere('permissions.id IN (:...permissions)', {
                permissions: [options.permission],
            });
        }
        if (orderBy) qb.orderBy(`user.${orderBy}`, 'ASC');
        return qb;
    }

    /**
     * 根据同步角色权限
     * @param user
     */
    protected async syncRoles(user: UserEntity) {
        const roleRelation = this.userRepository.createQueryBuilder().relation('roles').of(user);
        const roleNames = (user.roles ?? []).map(({ name }) => name);
        const noRoles =
            roleNames.length <= 0 ||
            (!roleNames.includes(SystemRoles.USER) && !roleNames.includes(SystemRoles.SUPER_ADMIN));
        const isSuperAdmin = roleNames.includes(SystemRoles.SUPER_ADMIN);

        // 为普通用户添加custom-user角色
        // 为超级管理员添加super-admin角色
        if (noRoles) {
            const customRole = await this.roleRepository.findOne({
                relations: ['users'],
                where: { name: SystemRoles.USER },
            });
            if (!isNil(customRole)) await roleRelation.add(customRole);
        } else if (isSuperAdmin) {
            const adminRole = await this.roleRepository.findOne({
                relations: ['users'],
                where: { name: SystemRoles.SUPER_ADMIN },
            });
            if (!isNil(adminRole)) await roleRelation.addAndRemove(adminRole, user.roles);
        }
    }
}
