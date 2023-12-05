import { Column, CreateDateColumn, Entity, Index, JoinColumn, ManyToOne, OneToMany, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";
import { Prod } from './prod.entity';
import type { Relation } from 'typeorm';
import { ShopcartItem } from "@/service/shopcart/entities/shopcart-item.entity";
import { CommonStatus, DeleteStatus } from "@/common/core/constants/enums";
@Index("prod_id", ["prod"], {})
@Entity("tz_sku", { schema: "tz_shops" })
export class Sku {
  @PrimaryGeneratedColumn({
    type: "bigint",
    name: "sku_id",
    comment: "单品ID",
    unsigned: true,
  })
  skuId: string;

  @ManyToOne(() => Prod, (Prod) => Prod.skus)
  @JoinColumn({ name: 'prod_id' })
  prod: Relation<Prod>;

  @Column("bigint", { name: "prod_id", comment: "商品ID", unsigned: true })
  prodId: string;

  @Column("decimal", {
    name: "ori_price",
    nullable: true,
    comment: "原价",
    precision: 15,
    scale: 2,
  })
  oriPrice: string | null;

  @Column("decimal", {
    name: "price",
    nullable: true,
    comment: "价格",
    precision: 15,
    scale: 2,
  })
  price: string | null;

  @Column("int", {
    name: "stocks",
    comment: "商品在付款减库存的状态下，该sku上未付款的订单数量",
  })
  stocks: number;

  @Column("int", { name: "actual_stocks", nullable: true, comment: "实际库存" })
  actualStocks: number | null;

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

  @Column("varchar", {
    name: "pic",
    nullable: true,
    comment: "sku图片",
    length: 500,
  })
  pic: string | null;

  @Column("varchar", {
    name: "sku_name",
    nullable: true,
    comment: "sku名称",
    length: 120,
  })
  skuName: string | null;

  @Column("varchar", {
    name: "prod_name",
    nullable: true,
    comment: "商品名称",
    length: 255,
  })
  prodName: string | null;

  @Column("int", { name: "version", comment: "版本号", default: () => "'0'" })
  version: number;

  @Column({
    name: 'status',
    type: 'int',
    enum: CommonStatus,
    comment: '状态(1为启用,0为禁用)',
    default: CommonStatus.ACTIVE,
  })
  status: CommonStatus;

  @Column({
    name: 'is_delete',
    type: 'int',
    enum: DeleteStatus,
    comment: '状态(1为已删除,0为未删除)',
    default: DeleteStatus.UnDeleted,
  })
  isDelete: DeleteStatus | null;

  @Column("varchar", {
    name: "attr",
    nullable: true,
    comment: "所有销售属性值的json串",
    length: 100,
  })
  attr: string;

  @OneToMany(() => ShopcartItem, (ShopcartItem) => ShopcartItem.sku)
  shopcartItems: Relation<ShopcartItem>[];
}
