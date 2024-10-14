import { IsNumber, IsOptional, IsString } from "class-validator";

export class ChangeShopcartDTO {

    @IsOptional()
    shopcartItemId: string;

    @IsString()
    prodId: string;

    @IsString()
    skuId: string;

    //商品变更数量
    @IsNumber()
    itemCount: number;
}