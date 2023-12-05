import { Column, CreateDateColumn, Entity, JoinColumn, ManyToOne, UpdateDateColumn } from "typeorm";
import { Prod } from "./prod.entity";
import type { Relation } from 'typeorm';
import { CommonStatus } from "@/common/core/constants/enums";
@Entity("tz_prod_attrvalue", { schema: "tz_shops" })
export class ProdAttrvalue {
  @Column("bigint", { primary: true, name: "attr_value_id" })
  attrValueId: string;

  @Column("bigint", { name: "attr_id", nullable: true, comment: "销售属性id" })
  attrId: string | null;

  @Column("varchar", {
    name: "attr_name",
    nullable: true,
    comment: "销售属性名",
    length: 255,
  })
  attrName: string | null;

  @Column("varchar", {
    name: "attr_value_name",
    nullable: true,
    comment: "销售属性值\n",
    length: 255,
  })
  attrValueName: string | null;

  @ManyToOne(() => Prod, (Prod) => Prod.prodAttrValues)
  @JoinColumn({ name: 'prod_id', referencedColumnName: 'prodId'})
  prod: Relation<Prod>;

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
