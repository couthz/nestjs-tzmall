import { Column, CreateDateColumn, Entity, PrimaryGeneratedColumn } from "typeorm";
import { CommonStatus } from "@/modules/core/constants/enums";
import { Transform } from "class-transformer";

@Entity("tz_seller_addr", { schema: "tz_shops" })
export class SellerAddr {
  @PrimaryGeneratedColumn({
    type: "bigint",
    name: "seller_addr_id",
    comment: "ID",
    unsigned: true,
  })
  sellerAddrId: string;

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

  @Column({
    name: 'status',
    type: 'int',
    enum: CommonStatus,
    comment: '状态(1为正常,0为删除)',
    default: CommonStatus.ACTIVE,
  })
  status: CommonStatus;

  @Column({
    name: 'default_consign_addr',
    type: 'tinyint',
    comment: '是否是默认发货地址',
  })
  @Transform(( {value} ) => value === 1 ? true : false)
  defaultConsignAddr: boolean;

  @Column({
    name: 'default_return_addr',
    type: 'tinyint',
    comment: '是否是默认退货地址',
  })
  @Transform(( {value} ) => value === 1 ? true : false)
  defaultReturnAddr: boolean;

  @Column("int", { name: "version", comment: "版本号", default: () => "'0'" })
  version: number;
  
}
