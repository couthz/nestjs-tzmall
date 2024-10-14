import { Column, CreateDateColumn, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn, UpdateDateColumn } from 'typeorm';
import { ProdCategory } from './prod-category.entity';
import type { Relation } from 'typeorm';
import { CommonStatus } from '@/modules/core/constants/enums';
import { Transform } from 'class-transformer';
@Entity('tz_prod_cate_attr', { schema: 'tz_shops' })
export class ProdCateAttr {
    @PrimaryGeneratedColumn({
        type: "bigint",
        name: "attr_id",
        comment: "ID",
        unsigned: true,
      })
    attrId: string;

    @Column('bigint', {
      name: 'category_id',
      nullable: true,
      comment: '商品分类',
      unsigned: true,
    })
    categoryId: string;

    @ManyToOne(() => ProdCategory, (ProdCategory) => ProdCategory.prodCateAttrs)
    @JoinColumn({ name: 'category_id', referencedColumnName: 'categoryId' })
    prodCategory: Relation<ProdCategory>;

    @Column('varchar', { name: 'attr_name', length: 255 })
    attrName: string;

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

    @Column({
        name: 'status',
        type: 'int',
        enum: CommonStatus,
        comment: '状态(1为正常,0为删除)',
        default: CommonStatus.ACTIVE,
    })
    status: CommonStatus;

    @Column({
        name: 'is_main_attr',
        type: 'tinyint',
        comment: '是否为主要属性(需要配图)',
    })
    @Transform(( {value} ) => value === 1 ? true : false)
    isMainAttr: boolean;
}
