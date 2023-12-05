import { Column, CreateDateColumn, Entity, OneToOne, PrimaryGeneratedColumn } from "typeorm";
import { Order } from "./order.entity";
import type { Relation }  from 'typeorm';

@Entity("tz_order_addr", { schema: "tz_shops" })
export class OrderAddr {
  @PrimaryGeneratedColumn({
    type: "bigint",
    name: "order_addr_id",
    comment: "ID",
    unsigned: true,
  })
  orderAddrId: string;

  @Column("bigint", { name: "addr_id", comment: "地址ID", unsigned: true })
  addrId: string;

  @Column("bigint", {
    name: "user_id",
    comment: "用户ID",
    default: () => "'0'",
  })
  userId: string;

  @Column("varchar", {
    name: "receiver",
    nullable: true,
    comment: "收货人",
    length: 50,
  })
  receiver: string | null;

  @Column("bigint", { name: "province_id", nullable: true, comment: "省ID" })
  provinceId: string | null;

  @Column("varchar", {
    name: "province",
    nullable: true,
    comment: "省",
    length: 100,
  })
  province: string | null;

  @Column("bigint", { name: "area_id", nullable: true, comment: "区域ID" })
  areaId: string | null;

  @Column("varchar", {
    name: "area",
    nullable: true,
    comment: "区",
    length: 20,
  })
  area: string | null;

  @Column("bigint", { name: "city_id", nullable: true, comment: "城市ID" })
  cityId: string | null;

  @Column("varchar", {
    name: "city",
    nullable: true,
    comment: "城市",
    length: 20,
  })
  city: string | null;

  @Column("varchar", {
    name: "addr",
    nullable: true,
    comment: "地址",
    length: 1000,
  })
  addr: string | null;

  @Column("varchar", {
    name: "post_code",
    nullable: true,
    comment: "邮编",
    length: 15,
  })
  postCode: string | null;

  @Column("varchar", {
    name: "mobile",
    nullable: true,
    comment: "手机",
    length: 20,
  })
  mobile: string | null;

  @CreateDateColumn({ name: "create_time", comment: "建立时间" })
  createTime: Date;

  @Column("int", { name: "version", comment: "版本号", default: () => "'0'" })
  version: number;
  
  @OneToOne(() => Order, (Order) => Order.orderAddr)
  order: Relation<Order>;
}
