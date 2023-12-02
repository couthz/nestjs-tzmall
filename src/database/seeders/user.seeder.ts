import { isNil } from 'lodash';
import { DataSource, EntityManager } from 'typeorm';

import { BaseSeeder } from '@/modules/database/base/seeder';
import { getCustomRepository } from '@/modules/database/helpers';
import { DbFactory } from '@/modules/database/types';
import { AccessTokenEntity, RefreshTokenEntity, UserEntity } from '@/modules/user/entities';
import { UserRepository } from '@/modules/user/repositories';

import { IUserFactoryOptions } from '../factories/user.factory';

export default class UserSeeder extends BaseSeeder {
    protected truncates = [UserEntity, AccessTokenEntity, RefreshTokenEntity];

    protected factorier!: DbFactory;

    async run(_factorier: DbFactory, _dataSource: DataSource, _em: EntityManager): Promise<any> {
        this.factorier = _factorier;
        await this.loadUsers();
    }

    private async loadUsers() {
        const repository = getCustomRepository(this.dataSource, UserRepository);
        const userFactory = this.factorier(UserEntity);
        const creator = await repository.findOneBy({ username: 'pincman' });
        if (isNil(creator)) {
            await userFactory<IUserFactoryOptions>({
                username: 'pincman',
                nickname: 'pincman',
                password: '123456aA$',
            }).create({}, 'username');
        }
        const count = await repository.count();
        if (count < 2) {
            await userFactory<IUserFactoryOptions>({
                username: 'xiaoming',
                nickname: '小明',
                phone: '+86.18605853847',
                password: '123456aA$',
            }).create({}, 'username');

            await userFactory<IUserFactoryOptions>({
                username: 'lige',
                nickname: '李哥',
                phone: '+86.15955959999',
                password: '123456aA$',
            }).create({}, 'username');
            await userFactory<IUserFactoryOptions>().createMany(15, {}, 'username');
        }
    }
}
