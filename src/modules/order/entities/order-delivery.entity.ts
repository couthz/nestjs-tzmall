import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";
@Entity("tz_order_delivery", { schema: "tz_shops" })
export class OrderDelivery {
  @PrimaryGeneratedColumn({
    type: "bigint",
    name: "delivery_id",
    comment: "ID",
    unsigned: true,
  })
  deliveryId: string;

  @Column("varchar", {
    name: "delivery_number",
    comment: "物流单号",
    length: 100,
  })
  deliveryNumber: string;

  @Column("varchar", {
    name: "delivery_data",
    nullable: true,
    comment: "物流数据",
    length: 1000,
  })
  deliveryData: string | null;

  @Column("varchar", {
    name: "dvy_flow_code",
    comment: "物流公司编码",
    length: 20,
  })
  dvyFlowCode: string;

  @Column("int", {
    name: "delivery_state",
    nullable: true,
    comment: "物流状态 2-在途中,3-签收,4-问题件",
  })
  deliveryState: number | null;
}