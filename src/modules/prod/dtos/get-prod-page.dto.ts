import { PaginateDto } from "@/modules/restful/dtos";
import { ProdStatus } from "../enums/prod.enum";

export class GetProdPageDTO extends PaginateDto{
    /**
     * 分类ID
     */
    status: ProdStatus;
}