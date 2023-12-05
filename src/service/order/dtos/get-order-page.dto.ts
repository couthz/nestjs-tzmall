import { PaginateDto } from "@/common/restful/dtos";
import { OrderStatus } from "../enums/order.enum";

export class GetOrderPageDTO extends PaginateDto {
    /**
     * 订单状态
     */
    status: OrderStatus;
}