import { Entity, ManyToOne, OneToOne } from 'typeorm';
import type { Relation } from 'typeorm';

import { BaseToken } from './base.token';
import { RefreshTokenEntity } from './refresh-token.entity';
import { UserEntity } from './user.entity';

/**
 * 用户认证token模型
 */
@Entity('user_access_tokens')
export class AccessTokenEntity extends BaseToken {
    /**
     * @description 关联的刷新令牌
     * @type {RefreshTokenEntity}
     */
    @OneToOne(() => RefreshTokenEntity, (refreshToken) => refreshToken.accessToken, {
        cascade: true,
    })
    refreshToken: RefreshTokenEntity;

    /**
     * @description 所属用户
     * @type {UserEntity}
     */
    @ManyToOne((type) => UserEntity, (user) => user.accessTokens, {
        onDelete: 'CASCADE',
    })
    user: Relation<UserEntity>;
}
