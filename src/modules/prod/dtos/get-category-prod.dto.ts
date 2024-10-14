import { PaginateDto } from "@/modules/restful/dtos";

export class GetCategoryProdDTO extends PaginateDto{
    /**
     * 分类ID
     */
    categoryId: string;
}