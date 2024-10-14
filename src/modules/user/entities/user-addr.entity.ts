import { Column, CreateDateColumn, Entity, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";

@Entity("tz_user_addr", { schema: "tz_shops" })
export class UserAddr {
  @PrimaryGeneratedColumn({
    type: "bigint",
    name: "addr_id",
    comment: "ID",
    unsigned: true,
  })
  addrId: string;

  @Column("varchar", {
    name: "user_id",
    comment: "用户ID",
    length: 36,
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

  @Column("varchar", {
    name: "city",
    nullable: true,
    comment: "城市",
    length: 20,
  })
  city: string | null;

  @Column("bigint", { name: "city_id", nullable: true, comment: "城市ID" })
  cityId: string | null;

  @Column("varchar", {
    name: "area",
    nullable: true,
    comment: "区",
    length: 20,
  })
  area: string | null;

  @Column("bigint", { name: "area_id", nullable: true, comment: "区ID" })
  areaId: string | null;

  @Column("varchar", {
    name: "post_code",
    nullable: true,
    comment: "邮编",
    length: 15,
  })
  postCode: string | null;

  @Column("varchar", {
    name: "addr",
    nullable: true,
    comment: "地址",
    length: 1000,
  })
  addr: string | null;

  @Column("varchar", {
    name: "mobile",
    nullable: true,
    comment: "手机",
    length: 20,
  })
  mobile: string | null;

  @Column("int", { name: "status", comment: "状态,1正常，0无效" })
  status: number;

  @Column("int", {
    name: "common_addr",
    comment: "是否默认地址 1是",
    default: () => "'0'",
  })
  commonAddr: number;

  @CreateDateColumn({ name: "create_time", comment: "建立时间" })
  createTime: Date;

  @Column("int", { name: "version", comment: "版本号", default: () => "'0'" })
  version: number;

  @UpdateDateColumn({ name: "update_time", comment: "更新时间" })
  updateTime: Date;
}
