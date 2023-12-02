import { Entity, JoinColumn, OneToOne } from 'typeorm';
import type { Relation } from 'typeorm';

import { AccessTokenEntity } from './access-token.entity';
import { BaseToken } from './base.token';

/**
 * 刷新Token的Token模型
 */
@Entity('user_refresh_tokens')
export class RefreshTokenEntity extends BaseToken {
    /**
     * 关联的登录令牌
     */
    @OneToOne(() => AccessTokenEntity, (accessToken) => accessToken.refreshToken, {
        onDelete: 'CASCADE',
    })
    @JoinColumn()
    accessToken: Relation<AccessTokenEntity>;
}
