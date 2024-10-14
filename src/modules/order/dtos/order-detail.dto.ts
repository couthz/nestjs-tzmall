import { Order, OrderDelivery } from "../entities";

export class OrderDetailDTO {
    order: Order;

    orderDeliveryInfos: OrderDelivery[];
}