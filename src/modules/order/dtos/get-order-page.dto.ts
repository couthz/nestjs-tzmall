import { OrderStatus } from "../enums/order.enum";

export class GetOrderPageDTO {
    /**
     * 订单状态
     */
    status: OrderStatus;
}