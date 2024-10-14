import { IsString } from "class-validator";

export class ChangePriceDTO {

    @IsString()
    orderId: string;
    @IsString()
    transfee: string;
    @IsString()
    changePrice: string;
    @IsString()
    actualTotalPay: string;
}