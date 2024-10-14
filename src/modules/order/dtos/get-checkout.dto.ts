import { IsNotEmpty } from "class-validator";

//请求结算页信息的通用参数
export class GetCheckOutDTO {

    @IsNotEmpty()
    addrId: string; //地址ID
    //TODO 优惠券

}