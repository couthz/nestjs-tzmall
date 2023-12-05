import { Column, CreateDateColumn, Entity, Index, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { Order } from "./order.entity";
import type { Relation }  from 'typeorm';
import { OrderDeliveryStatus, OrderItemCommentStatus } from "../enums/order.enum";

@Index("order_number", ["orderNumber"], {})
@Entity("tz_order_item", { schema: "tz_shops" })
export class OrderItem {
  @PrimaryGeneratedColumn({
    type: "bigint",
    name: "order_item_id",
    comment: "订单项ID",
    unsigned: true,
  })
  orderItemId: string;

  @ManyToOne(() => Order, (Order) => Order.orderItems)
  @JoinColumn({ name: 'order_id' })
  order: Relation<Order>;

  @Column("bigint", { name: "order_id", comment: "订单ID", unsigned: true })
  orderId: string;

  @Column("varchar", {
    name: "order_number",
    comment: "订单order_number",
    length: 50,
  })
  orderNumber: string;

  @Column("bigint", { name: "prod_id", comment: "产品ID", unsigned: true })
  prodId: string;

  @Column("bigint", { name: "sku_id", comment: "产品SkuID", unsigned: true })
  skuId: string;

  @Column("int", {
    name: "item_count",
    comment: "购物车产品个数",
    default: () => "'0'",
  })
  itemCount: number;

  @Column("varchar", { name: "prod_name", comment: "产品名称", length: 120 })
  prodName: string;

  @Column("varchar", {
    name: "sku_name",
    nullable: true,
    comment: "sku名称",
    length: 120,
  })
  skuName: string | null;

  @Column("varchar", { name: "pic", comment: "产品主图片路径", length: 255 })
  pic: string | null;

  @Column("decimal", {
    name: "price",
    comment: "产品价格",
    precision: 15,
    scale: 2,
  })
  price: string;

  @Column("bigint", { name: "user_id", comment: "用户Id" })
  userId: string;

  @Column("decimal", {
    name: "total_pay",
    comment: "商品总金额",
    precision: 15,
    scale: 2,
  })
  totalPay: string;

  @CreateDateColumn({ name: "create_time", comment: "购物时间" })
  createTime: Date;

  @Column({
    name: "comm_sts",
    type: "enum",
    enum: OrderItemCommentStatus,
    comment: "评论状态 0 未评论 1 已评论",
    default: OrderItemCommentStatus.UNCOMMENT,
  })
  commSts: OrderItemCommentStatus;

  @Column("datetime", {
    name: "add_shopcart_date",
    nullable: true,
    comment: "加入购物车时间",
  })
  addShopcartDate: Date | null;

  @Column("int", {
    name: "aftersale_status",
    comment:
      "售后状态：0 未售后 100 退款中 101 换货中 200 退款成功 201 换货成功 300 退款关闭 301 换货关闭",
  })
  aftersaleStatus: number;

  @Column({
    name: "delivery_status",
    type: "enum",
    enum: OrderDeliveryStatus,
    comment: "发货状态 0 未发货 1 已发货 2 已收货",
    default: OrderDeliveryStatus.UNDELIVERED,
  })
  deliveryStatus: OrderDeliveryStatus;

  @Column("varchar", { name: "dvy_flow_numbers", nullable: true, length: 255 })
  dvyFlowNumbers: string | null;
  
}
