import { Sku } from '../entities';
import { ProdStatus } from '../enums/prod.enum';
import { ProdSkuSelectDTO } from './prod-sku-select.dto';
import type { Relation } from 'typeorm';

export class ProdDetailDTO {
    prodId: string;

    prodName: string;

    oriPrice: string | null;

    price: string | null;

    costPrice: string | null;

    brief: string | null;

    content: string | null;

    pic: string | null;

    imgs: string | null;

    status: ProdStatus;

    categoryId: string | null;

    soldNum: number | null;

    totalStocks: number | null;

    returnNum: number | null;
    
    deliveryTemplateId: string | null;

    version: number | null;

    contentImg: string | null;

    skus: Relation<Sku[]>;

    prodSkuSelectDTO: Relation<ProdSkuSelectDTO>;
}