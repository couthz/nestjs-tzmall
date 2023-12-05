import {
    Column,
    CreateDateColumn,
    Entity,
    Index,
    JoinColumn,
    ManyToOne,
    OneToMany,
    PrimaryGeneratedColumn,
    UpdateDateColumn,
} from 'typeorm';
import type { Relation } from 'typeorm';
import { ProdStatus } from '../enums/prod.enum';
import { ProdAttrvalue } from './prod-attrvalue.entity';
import { Sku } from './sku.entity';
import { ShopcartItem } from '@/service/shopcart/entities/shopcart-item.entity';
import { ProdCategory } from './prod-category.entity';

@Index('prod_putaway_idx', ['putawayTime'], {})
@Entity('tz_prod', { schema: 'tz_shops' })
export class Prod {
    @PrimaryGeneratedColumn({
        type: 'bigint',
        name: 'prod_id',
        comment: '产品ID',
        unsigned: true,
    })
    prodId: string;

    @Column('varchar', { name: 'prod_name', comment: '商品名称', length: 300 })
    prodName: string;

    @Column('decimal', {
        name: 'ori_price',
        nullable: true,
        comment: '原价',
        precision: 15,
        scale: 2,
        default: () => "'0.00'",
    })
    oriPrice: string | null;

    @Column('decimal', {
        name: 'price',
        nullable: true,
        comment: '现价',
        precision: 15,
        scale: 2,
    })
    price: string | null;

    @Column('decimal', {
        name: 'cost_price',
        nullable: true,
        comment: '成本价',
        precision: 15,
        scale: 2,
    })
    costPrice: string | null;

    @Column('varchar', {
        name: 'brief',
        nullable: true,
        comment: '简要描述,卖点等',
        length: 500,
    })
    brief: string | null;

    @Column('text', { name: 'content', nullable: true, comment: '详细描述' })
    content: string | null;

    @Column('varchar', {
        name: 'pic',
        nullable: true,
        comment: '商品主图',
        length: 255,
    })
    pic: string | null;

    @Column('varchar', {
        name: 'imgs',
        nullable: true,
        comment: '商品图片，以,分割',
        length: 1000,
    })
    imgs: string | null;

    @Column({
        name: 'status',
        type: 'int',
        enum: ProdStatus,
        comment: '默认是1，表示正常状态, -1表示删除, 0下架',
        default: ProdStatus.OFFLINE,
    })
    status: ProdStatus;

    @Column('bigint', {
        name: 'category_id',
        nullable: true,
        comment: '商品分类',
        unsigned: true,
    })
    categoryId: string | null;

    @ManyToOne(() => ProdCategory, (ProdCategory) => ProdCategory.prods)
    @JoinColumn({ name: 'category_id' })
    category: ProdCategory;

    @Column('int', { name: 'sold_num', nullable: true, comment: '销量' })
    soldNum: number | null;

    @Column('int', {
        name: 'total_stocks',
        nullable: true,
        comment: '总库存',
        default: () => "'0'",
    })
    totalStocks: number | null;

    @Column('int', { name: 'return_num', nullable: true, comment: '退货数量' })
    returnNum: number | null;

    @Column('bigint', {
        name: 'delivery_template_id',
        nullable: true,
        comment: '运费模板id',
    })
    deliveryTemplateId: string | null;

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

    @Column('datetime', {
        name: 'putaway_time',
        nullable: true,
        comment: '上架时间',
    })
    putawayTime: Date | null;

    @Column('int', { name: 'version', nullable: true, comment: '版本 乐观锁' })
    version: number | null;

    @Column('text', {
        name: 'content_img',
        nullable: true,
        comment: '内容中的图片',
    })
    contentImg: string | null;

    @OneToMany(() => ProdAttrvalue, (ProdAttrvalue) => ProdAttrvalue.prod)
    prodAttrValues: Relation<ProdAttrvalue[]>;

    @OneToMany(() => Sku, (Sku) => Sku.prod)
    skus: Relation<Sku[]>;

    @OneToMany(() => ShopcartItem, (ShopcartItem) => ShopcartItem.prod)
    shopcartItems: Relation<ShopcartItem>[];
}
