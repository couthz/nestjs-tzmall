import { IsNotEmpty } from "class-validator";

export class DeleteShopcartDTO {
    
    @IsNotEmpty()
    shopcartItemIds: string[];
}