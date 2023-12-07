import { isNil } from 'lodash';
import { DataSource, EntityManager } from 'typeorm';

import { BaseSeeder } from '@/modules/database/base/seeder';
import { getCustomRepository } from '@/modules/database/helpers';
import { DbFactory } from '@/modules/database/types';
import { SystemRoles } from '@/modules/rbac/constants';
import { PermissionEntity, RoleEntity } from '@/modules/rbac/entities';
import { RbacResolver } from '@/modules/rbac/rbac.resolver';
import { RoleRepository } from '@/modules/rbac/repositories';
import { AccessTokenEntity, RefreshTokenEntity, UserEntity } from '@/modules/user/entities';
import { UserRepository } from '@/modules/user/repositories';

import { IUserFactoryOptions } from '../factories/user.factory';

export default class UserSeeder extends BaseSeeder {
    protected truncates = [
        UserEntity,
        AccessTokenEntity,
        RefreshTokenEntity,
        RoleEntity,
        PermissionEntity,
        'rbac_roles_users_users',
    ];

    protected factorier!: DbFactory;

    async run(_factorier: DbFactory, _dataSource: DataSource, _em: EntityManager): Promise<any> {
        this.factorier = _factorier;
        const rbac = new RbacResolver(this.dataSource, this.configure);
        await rbac.syncRoles(this.em);
        await rbac.syncPermissions(this.em);
        await this.loadSuperUser(rbac);
        await this.loadUsers();
    }

    private async loadSuperUser(rbac: RbacResolver) {
        const repository = getCustomRepository(this.dataSource, UserRepository);
        const creator = await repository.findOneBy({ username: 'pincman' });
        const userFactory = this.factorier(UserEntity);
        if (isNil(creator)) {
            await userFactory<IUserFactoryOptions>({
                username: 'pincman',
                nickname: 'pincman',
                password: '123456aA$',
            }).create({}, 'username');
        }
        await rbac.syncSuperAdmin(this.em);
    }

    private async loadUsers() {
        const userRole = await getCustomRepository(this.dataSource, RoleRepository).findOneBy({
            name: SystemRoles.USER,
        });
        const roles = isNil(userRole) ? [] : [userRole];
        const repository = getCustomRepository(this.dataSource, UserRepository);
        const userFactory = this.factorier(UserEntity);
        const count = await repository.count();
        if (count < 2) {
            await userFactory<IUserFactoryOptions>({
                username: 'xiaoming',
                nickname: '小明',
                phone: '+86.18605853847',
                password: '123456aA$',
                roles,
            }).create({}, 'username');

            await userFactory<IUserFactoryOptions>({
                username: 'lige',
                nickname: '李哥',
                phone: '+86.15955959999',
                password: '123456aA$',
                roles,
            }).create({}, 'username');
            await userFactory<IUserFactoryOptions>().createMany(15, { roles }, 'username');
        }
    }
}
