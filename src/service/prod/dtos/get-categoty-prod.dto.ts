import { PaginateDto } from "@/common/restful/dtos";

export class GetCategoryProdDTO extends PaginateDto{
    /**
     * 分类ID
     */
    categoryId: string;
}