import { ApiProperty } from '@nestjs/swagger';
import { ProdAttrvalue, ProdCateAttr, Sku } from '../entities';
import { ProdStatus } from '../enums/prod.enum';
import { ProdCategoryDescDTO } from './prod-cate-desc.dto';

export class ProdDetailWithAttrDTO {
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

    contentImg: string | null;

    createTime: Date;

    updateTime: Date;

    putawayTime: Date | null;

    @ApiProperty()
    categoryList: ProdCategoryDescDTO[];

    @ApiProperty()
    prodCateAttrList: ProdCateAttr[]; 
    
    @ApiProperty()
    attrMap: Map<string, ProdAttrvalue[]>;

    @ApiProperty()
    attrSkuMap: Map<string, Sku>;
}