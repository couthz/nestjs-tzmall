import { IsArray, IsBoolean } from "class-validator";

export class ChangeItemCheckedDTO {

    @IsArray()
    shopcartItemIds: string[];

    @IsBoolean()
    isChecked: boolean;
}