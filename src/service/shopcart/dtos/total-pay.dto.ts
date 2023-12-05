import { IsNotEmpty } from "class-validator";

export class TotalPayDTO {
    @IsNotEmpty()
    shopcartItemIds: [string];
}