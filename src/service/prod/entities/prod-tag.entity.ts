import {
    Column,
    CreateDateColumn,
    DeleteDateColumn,
    Entity,
    JoinTable,
    ManyToMany,
    PrimaryGeneratedColumn,
    UpdateDateColumn,
} from 'typeorm';

import { Prod } from './prod.entity';
import { CommonStatus } from '@/common/core/constants/enums';

@Entity('tz_prod_tag', { schema: 'tz_shops' })
export class ProdTag {
    @PrimaryGeneratedColumn({ type: 'bigint', name: 'id', comment: '分组标签id' })
    id: string;

    @Column('varchar', {
        name: 'title',
        nullable: true,
        comment: '分组标题',
        length: 36,
    })
    title: string | null;

    @Column({
        name: 'status',
        type: 'int',
        enum: CommonStatus,
        comment: '状态(1为正常,0为删除)',
        default: CommonStatus.ACTIVE,
    })
    status: CommonStatus;

    @Column('tinyint', {
        name: 'is_default',
        nullable: true,
        comment: '默认类型(0:商家自定义,1:系统默认)',
        width: 1,
    })
    isDefault: boolean | null;

    @Column('bigint', { name: 'prod_count', nullable: true, comment: '商品数量' })
    prodCount: string | null;

    @Column('int', {
        name: 'style',
        nullable: true,
        comment: '列表样式(0:一列一个,1:一列两个,2:一列三个)',
    })
    style: number | null;

    @Column('int', { name: 'seq', nullable: true, comment: '排序' })
    seq: number | null;

    @CreateDateColumn({
        name: 'create_time',
        comment: '创建时间',
    })
    createTime: Date;

    @UpdateDateColumn({
        name: 'update_time',
        comment: '修改时间',
    })
    updateTime: Date;

    @DeleteDateColumn({
        name: 'delete_time',
        comment: '删除时间',
    })
    deleteTime: Date;

    @ManyToMany(() => Prod)
    @JoinTable({
        name: 'tz_prod_tag_reference',
        joinColumn: { name: 'tag_id', referencedColumnName: 'id' },
        inverseJoinColumn: { name: 'prod_id', referencedColumnName: 'prodId' },
    })
    prods: Prod[];
}
