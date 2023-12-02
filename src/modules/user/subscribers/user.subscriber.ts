import { randomBytes } from 'crypto';

import { EventSubscriber, InsertEvent, UpdateEvent } from 'typeorm';

import { BaseSubscriber } from '@/modules/database/base';

import { UserEntity } from '../entities/user.entity';
import { encrypt } from '../helpers';

/**
 * 用户模型监听器
 */
@EventSubscriber()
export class UserSubscriber extends BaseSubscriber<UserEntity> {
    protected entity = UserEntity;

    /**
     * 生成不重复的随机用户名
     * @param event
     */
    protected async generateUserName(event: InsertEvent<UserEntity>): Promise<string> {
        const username = `user_${randomBytes(4).toString('hex').slice(0, 8)}`;
        const user = await event.manager.findOne(UserEntity, {
            where: { username },
        });
        return !user ? username : this.generateUserName(event);
    }

    /**
     * 自动生成唯一用户名和密码
     * @param event
     */
    async beforeInsert(event: InsertEvent<UserEntity>) {
        // 自动生成唯一用户名
        if (!event.entity.username) {
            event.entity.username = await this.generateUserName(event);
        }
        // 自动生成密码
        if (!event.entity.password) {
            event.entity.password = randomBytes(11).toString('hex').slice(0, 22);
        }
        // 自动加密密码
        event.entity.password = await encrypt(this.configure, event.entity.password);
    }

    /**
     * 当密码更改时加密密码
     * @param event
     */
    async beforeUpdate(event: UpdateEvent<UserEntity>) {
        if (this.isUpdated('password', event)) {
            event.entity.password = encrypt(this.configure, event.entity.password);
        }
    }
}
