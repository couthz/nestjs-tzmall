import type { Relation } from "typeorm";
import { ProdAttrvalue } from "../entities/prod-attrvalue.entity";
import { Sku } from "../entities/sku.entity";

export class ProdSkuSelectDTO {
    attrSkuMap: Relation<Map<string, Relation<Sku>>>;
    attrvalueMap: Map<string, [ProdAttrvalue]>;  
}