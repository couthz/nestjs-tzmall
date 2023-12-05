import { DtoValidation } from "@/common/core/decorators";

@DtoValidation()
export class ChangeShopcartDTO {

    shopcartItemId: string;

    prodId: string;

    skuId: string;

    itemCount: number;
}