import { CustomRepository } from "@/modules/database/decorators";
import { OrderPayment } from "../entities/order-payment.entity";
import { BaseRepository } from "@/modules/database/base";

@CustomRepository(OrderPayment)
export class OrderPaymentRepository extends BaseRepository<OrderPayment> {
    
    protected _qbName = "orderPayment";
    // Custom methods and queries can be added here
    buildBaseQB() {
        return this.createQueryBuilder('orderPayment');
    }
    getOrderPaymentByOrderNumber(orderNumber: string) {
        return this.buildBaseQB()
            .where('orderPayment.order_number = :orderNumber', { orderNumber })
            .getOne();

    }
}
