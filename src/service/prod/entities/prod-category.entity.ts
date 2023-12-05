import { Column, CreateDateColumn, DeleteDateColumn, Entity, Index, OneToMany, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";
import { Prod } from "./prod.entity";
import { ProdCateAttr } from "./prod-cate-attr.entity";
import type { Relation } from 'typeorm';
import { CommonStatus } from "@/common/core/constants/enums";

@Index("parent_id", ["parentId"], {})
@Entity("tz_prod_category", { schema: "tz_shops" })
export class ProdCategory {
  @PrimaryGeneratedColumn({
    type: "bigint",
    name: "category_id",
    comment: "类目ID",
    unsigned: true,
  })
  categoryId: string;

  @Column("bigint", { name: "parent_id", comment: "父节点", unsigned: true })
  parentId: string;

  @Column("varchar", {
    name: "category_name",
    comment: "产品类目名称",
    length: 50,
  })
  categoryName: string;

  @Column("varchar", {
    name: "icon",
    nullable: true,
    comment: "类目图标",
    length: 255,
  })
  icon: string | null;

  @Column("varchar", {
    name: "pic",
    nullable: true,
    comment: "类目的显示图片",
    length: 300,
  })
  pic: string | null;

  @Column("int", { name: "seq", comment: "排序" })
  seq: number;

  @Column({
    name: 'status',
    type: 'int',
    enum: CommonStatus,
    comment: '状态(1为正常,0为删除)',
    default: CommonStatus.ACTIVE,
  })
  status: CommonStatus;

  @Column("datetime", { name: "rec_time", comment: "记录时间" })
  recTime: Date;

  @Column("int", { name: "grade", comment: "分类层级" })
  grade: number;

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

  @OneToMany(() => Prod, (Prod) => Prod.category)
  prods: Prod[];

  @OneToMany(() => ProdCateAttr, (ProdCateAttr) => ProdCateAttr.prodCategory)
  prodCateAttrs: Relation<ProdCateAttr>[];
}
