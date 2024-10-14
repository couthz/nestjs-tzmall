import { ShopcartItem } from "../entities";

export class GetShopcartDTO {
    shopcartItems: ShopcartItem[];

    totalPay: string;
}