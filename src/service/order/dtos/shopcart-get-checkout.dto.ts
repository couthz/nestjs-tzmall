import { IsNotEmpty } from "class-validator";
import { GetCheckOutDTO } from "./get-checkout.dto";

//购物车点击结算后,请求结算页的参数
export class ShopcartGetCheckOutDTO extends GetCheckOutDTO {
    // Add additional properties or methods here
    @IsNotEmpty()
    shopcartItemIds: [string];
}