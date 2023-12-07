import * as fakerjs from '@faker-js/faker';

import { Configure } from '@/modules/config/configure';
import { defineFactory, getFakerLocales } from '@/modules/database/helpers';
import { RoleEntity } from '@/modules/rbac/entities';
import { UserEntity } from '@/modules/user/entities';

export type IUserFactoryOptions = Partial<{
    [key in keyof UserEntity]: UserEntity[key] & { roles?: RoleEntity[] };
}>;
export const UserFactory = defineFactory(
    UserEntity,
    async (configure: Configure, settings: IUserFactoryOptions = {}) => {
        const faker = new fakerjs.Faker({
            locale: await getFakerLocales(configure),
        });
        const user = new UserEntity();
        const optionals: (keyof IUserFactoryOptions)[] = ['username', 'password', 'email', 'phone'];
        optionals.forEach((key) => {
            if (settings[key] !== undefined) {
                user[key] = settings[key] as never;
            }
        });
        user.nickname = settings.nickname ?? faker.person.fullName();
        user.roles = settings.roles ?? [];
        return user;
    },
);
