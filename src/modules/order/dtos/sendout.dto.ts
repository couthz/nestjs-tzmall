import { IsNotEmpty, IsString } from "class-validator";
import { OrderAddrDTO } from "./order-addr.dto";

export class SendoutDTO {
    @IsString()
    orderId: string;
    @IsNotEmpty()
    selectedOrderItems: string[];
    @IsNotEmpty()
    flowNumbers: string[];
    @IsNotEmpty()
    orderAddrDTO: OrderAddrDTO;
}