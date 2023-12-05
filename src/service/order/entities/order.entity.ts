import { Column, CreateDateColumn, Entity, Index, JoinColumn, OneToMany, OneToOne, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";
import { OrderItem } from "./order-item.entity";
import { OrderAddr } from "./order-addr.entity";
import { OrderCloseType, OrderStatus, PayType, PayedStatus } from "../enums/order.enum";
import { DeleteStatus } from "@/common/core/constants/enums";
import type { Relation }  from 'typeorm';

@Index("order_number_unique_ind", ["orderNumber"], { unique: true })
@Index("order_number_userid_unique_ind", ["orderNumber", "userId"], {
  unique: true,
})
@Entity("tz_order", { schema: "tz_shops" })
export class Order {
  @PrimaryGeneratedColumn({
    type: "bigint",
    name: "order_id",
    comment: "订单ID",
    unsigned: true,
  })
  orderId: string;

  @Column("varchar", {
    name: "order_number",
    unique: true,
    comment: "订购流水号",
    length: 50,
  })
  orderNumber: string;

  @Column("int", {
    name: "total_count",
    nullable: true,
    comment: "订单商品总数",
  })
  totalCount: number | null;

  @Column("bigint", { name: "user_id", comment: "订购用户ID" })
  userId: string;

  @Column("decimal", {
    name: "total_pay",
    comment: "商品总价",
    precision: 15,
    scale: 2,
    default: () => "'0.00'",
  })
  totalPay: string;

  @Column({
    name: "pay_type",
    type: 'int',
    enum: PayType,
    comment: "支付方式1 微信支付 2 支付宝",
    default: PayType.WECAHT,
  })
  payType: PayType;

  @Column("varchar", {
    name: "buyer_remark",
    nullable: true,
    comment: "订单备注",
    length: 1024,
  })
  buyerRemark: string | null;

  @Column({
    name: "status",
    type: 'int',
    enum: OrderStatus,
    comment:
      "订单状态 100-待付款 101-已付款待发货 102-已发货待收货 103-已收货待评价 104-交易成功 200-交易关闭",
    default: OrderStatus.UNPAY,
  })
  status: OrderStatus;

  @Column("decimal", {
    name: "transfee",
    nullable: true,
    comment: "订单运费",
    precision: 15,
    scale: 2,
    default: () => "'0.00'",
  })
  transfee: string | null;

  @Column("bigint", {
    name: "order_addr_id",
    nullable: true,
    comment: "用户订单地址Id",
    unsigned: true 
  })
  orderAddrId: string | null;

  @OneToOne(() => OrderAddr, (OrderAddr) => OrderAddr.order)
  @JoinColumn({ name: "order_addr_id" })
  orderAddr: OrderAddr;

  @CreateDateColumn({ name: "create_time", comment: "订购时间" })
  createTime: Date;

  @UpdateDateColumn({
    name: "update_time",
    nullable: true,
    comment: "订单更新时间",
  })
  updateTime: Date | null;

  @Column("datetime", { name: "pay_time", nullable: true, comment: "付款时间" })
  payTime: Date | null;

  @Column("datetime", { name: "dvy_time", nullable: true, comment: "发货时间" })
  dvyTime: Date | null;

  @Column("datetime", {
    name: "finally_time",
    nullable: true,
    comment: "完成时间",
  })
  finallyTime: Date | null;

  @Column("datetime", {
    name: "cancel_time",
    nullable: true,
    comment: "取消时间",
  })
  cancelTime: Date | null;

  @Column({
    name: "is_payed",
    type: 'int',
    enum: PayedStatus,
    comment: "是否支付 0 未支付 1 已支付",
    default: PayedStatus.UNPAYED,
  })
  isPayed: PayedStatus;

  @Column({
    name: 'delete_status',
    type: 'int',
    enum: DeleteStatus,
    comment: '状态(1为已删除,0为未删除)',
    default: DeleteStatus.UnDeleted,
  })
  deleteStatus: DeleteStatus;

  @Column("decimal", {
    name: "reduce_amount",
    nullable: true,
    comment: "优惠总额",
    precision: 15,
    scale: 2,
  })
  reduceAmount: string | null;

  @Column({
    name: 'close_type',
    type: 'int',
    enum: OrderCloseType,
    comment: '订单关闭类型 0-订单活跃 1-超时未支付 2-退款关闭 3-卖家关闭 4-买家关闭',
    default: OrderCloseType.ACTIVE,
  })
  closeType: OrderCloseType;

  @Column("varchar", {
    name: "prod_name",
    nullable: true,
    comment: "商品名称，以逗号分隔",
    length: 255,
  })
  prodName: string | null;

  @Column("decimal", {
    name: "change_price",
    nullable: true,
    comment: "商家改价",
    precision: 10,
    scale: 2,
  })
  changePrice: string | null;

  @Column("varchar", { name: "user_mobile", nullable: true, length: 50 })
  userMobile: string | null;

  @Column("varchar", { name: "user_wechat", nullable: true, length: 100 })
  userWechat: string | null;

  @OneToMany(() => OrderItem, (OrderItem) => OrderItem.order)
  orderItems: Relation<OrderItem>[];
}
