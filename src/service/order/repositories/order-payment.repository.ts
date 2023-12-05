import { CustomRepository } from "@/common/database/decorators";
import { OrderPayment } from "../entities/order-payment.entity";
import { BaseRepository } from "@/common/database/base";

@CustomRepository(OrderPayment)
export class OrderPaymentRepository extends BaseRepository<OrderPayment> {
    protected _qbName = "orderPayment";
    // Custom methods and queries can be added here
}
