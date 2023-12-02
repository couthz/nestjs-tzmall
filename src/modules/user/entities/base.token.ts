import { Exclude } from 'class-transformer';
import { BaseEntity, Column, CreateDateColumn, PrimaryColumn } from 'typeorm';

/**
 * AccessToken与RefreshToken的公共字段
 */
@Exclude()
export abstract class BaseToken extends BaseEntity {
    @PrimaryColumn({ type: 'varchar', generated: 'uuid', length: 36 })
    id: string;

    /**
     * @description 令牌字符串
     * @type {string}
     */
    @Column({ length: 500 })
    value: string;

    @Column({
        comment: '令牌过期时间',
    })
    expired_at: Date;

    @CreateDateColumn({
        comment: '令牌创建时间',
    })
    createdAt: Date;
}
