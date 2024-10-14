import { PaginateDto } from "@/modules/restful/dtos";
import { IsString } from "class-validator";

export class GetProdCommentPageDTO extends PaginateDto{
    @IsString()
    prodId: string
}