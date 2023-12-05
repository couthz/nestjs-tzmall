import { Prod, Sku } from "@/service/prod/entities";
import { Column, CreateDateColumn, Entity, Index, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import type { Relation } from 'typeorm';
@Index("uk_user_shop_sku", ["sku", "userId"], { unique: true })
@Index("user_id", ["userId"], {})
@Entity("tz_shopcart_item", { schema: "tz_shops" })
export class ShopcartItem {
  @PrimaryGeneratedColumn({
    type: "bigint",
    name: "shopcart_item_id",
    comment: "主键",
    unsigned: true,
  })
  shopcartItemId: string;

  @ManyToOne(() => Prod, (Prod) => Prod.shopcartItems)
  @JoinColumn({ name: 'prod_id' })
  prod: Relation<Prod>;

  @ManyToOne(() => Sku, (Sku) => Sku.shopcartItems)
  @JoinColumn({ name: 'sku_id' })
  sku: Relation<Sku>;

  @Column("bigint", { name: "sku_id", comment: "sku_id", unsigned: true})
  skuId: string;

  @Column("bigint", { name: "prod_id", comment: "产品ID", unsigned: true})
  prodId: string;

  @Column("varchar", { name: "user_id", comment: "用户ID", length: 50 })
  userId: string;

  @Column("int", {
    name: "item_count",
    comment: "购物车产品个数",
    default: () => "'0'",
  })
  itemCount: number;

  @CreateDateColumn({ name: "add_date", comment: "购物时间" })
  addDate: Date;
}
