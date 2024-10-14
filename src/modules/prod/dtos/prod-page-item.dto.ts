import { Relation } from "typeorm";
import { ProdStatus } from "../enums/prod.enum";
import { ProdSkuSelectDTO } from "./prod-sku-select.dto";

export class ProdPageItemDTO {
    prodId: string;

    prodName: string;

    oriPrice: string | null;

    price: string | null;

    costPrice: string | null;

    brief: string | null;

    pic: string | null;

    imgs: string | null;

    status: ProdStatus;

    categoryId: string | null;

    soldNum: number | null;

    totalStocks: number | null;

    returnNum: number | null;
    
    deliveryTemplateId: string | null;

    prodSkuSelectDTO: Relation<ProdSkuSelectDTO>;
}