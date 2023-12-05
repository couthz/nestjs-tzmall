import { IsNotEmpty } from "class-validator";

//点击立即购买时，传递的商品相关信息
export class BuynowSkuDTO {

    @IsNotEmpty()
    prodId: string;
    @IsNotEmpty()
    skuId: string;
    @IsNotEmpty()
    itemCount: number;
}