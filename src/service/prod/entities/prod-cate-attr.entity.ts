import { Column, CreateDateColumn, Entity, JoinColumn, ManyToOne, UpdateDateColumn } from "typeorm";
import { ProdCategory } from "./prod-category.entity";
import type { Relation } from 'typeorm';
import { CommonStatus } from "@/common/core/constants/enums";
@Entity("tz_prod_cate_attr", { schema: "tz_shops" })
export class ProdCateAttr {
  @Column("bigint", { primary: true, name: "attr_id" })
  attrId: string;

  @ManyToOne(() => ProdCategory, (ProdCategory) => ProdCategory.prodCateAttrs)
  @JoinColumn({ name: 'category_id' , referencedColumnName: 'categoryId'})
  prodCategory: Relation<ProdCategory>;

  @Column("varchar", { name: "attr_name", length: 255 })
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
}
