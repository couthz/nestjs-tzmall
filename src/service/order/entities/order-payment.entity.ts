import { Column, CreateDateColumn, Entity, Index, PrimaryGeneratedColumn } from "typeorm";
import { PayType, PayedStatus } from "../enums/order.enum";

@Index("primary_order_no", ["orderNumber"], { unique: true })
@Index("user_id", ["userId"], {})
@Entity("tz_order_payment", { schema: "tz_shops" })
export class OrderPayment {
  @PrimaryGeneratedColumn({
    type: "bigint",
    name: "payment_id",
    comment: "订单支付单据ID",
    unsigned: true,
  })
  paymentId: string;

  @Column("varchar", {
    name: "pay_no",
    nullable: true,
    comment: "支付单号",
    length: 36,
  })
  payNo: string | null;

  @Column("varchar", {
    name: "biz_pay_no",
    nullable: true,
    comment: "外部订单流水号",
    length: 255,
  })
  bizPayNo: string | null;

  @Column("varchar", {
    name: "order_number",
    nullable: true,
    unique: true,
    comment: "order表中的订单号",
    length: 36,
  })
  orderNumber: string | null;

  @Column({
    name: "pay_type",
    type: 'int',
    enum: PayType,
    comment: "支付方式1 微信支付 2 支付宝",
    default: PayType.WECAHT,
  })
  payType: PayType;

  @Column("varchar", {
    name: "pay_type_name",
    nullable: true,
    comment: "支付方式名称",
    length: 50,
  })
  payTypeName: string | null;

  @Column("decimal", {
    name: "total_pay",
    nullable: true,
    comment: "支付金额",
    precision: 15,
    scale: 2,
  })
  totalPay: string | null;

  @Column("int", {
    name: "is_clearing",
    nullable: true,
    comment: "是否清算 0:否 1:是",
  })
  isClearing: number | null;

  @Column("varchar", {
    name: "user_id",
    nullable: true,
    comment: "用户ID",
    length: 36,
  })
  userId: string | null;

  @CreateDateColumn({ name: "create_time", comment: "创建时间" })
  createTime: Date;

  @Column("datetime", {
    name: "clearing_time",
    nullable: true,
    comment: "清算时间",
  })
  clearingTime: Date | null;

  @Column("int", { name: "version", nullable: true, comment: "版本号" })
  version: number | null;

  @Column({
    name: "pay_status",
    type: 'int',
    enum: PayedStatus,
    comment: "是否支付 0 未支付 1 已支付",
    default: PayedStatus.UNPAYED,
  })
  payStatus: PayedStatus;
}
