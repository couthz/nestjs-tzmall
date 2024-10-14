import {  IsDefined, IsNumber, IsOptional, IsString } from "class-validator";
import { AttrListEntryDTO } from "./attr-list-entry.dto";
import { SkuEntryDTO } from "./sku-entry.dto";

export class UpdateProdDTO {
    @IsString()
    prodId: string;
    @IsString()
    prodName: string;
    @IsString()
    oriPrice: string;
    @IsString()
    price: string;
    
    @IsOptional()
    @IsString()
    costPrice: string | null;
    @IsOptional()
    @IsString()
    brief: string | null;
    @IsOptional()
    @IsString()
    content: string | null;
    @IsString()
    pic: string;
    @IsString()
    imgs: string;
    @IsNumber()
    status: number;
    @IsString()
    categoryId: string;
    @IsNumber()
    soldNum: number;
    @IsNumber()
    totalStocks: number;
    @IsNumber()
    returnNum: number;
    @IsString()
    deliveryTemplateId: string;
    @IsString()
    contentImg: string;

    @IsDefined()
    attrListData: AttrListEntryDTO[];

    @IsDefined()
    skuList: SkuEntryDTO[];

}