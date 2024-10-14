import type { Relation } from "typeorm";
import { ProdAttrvalue } from "../entities/prod-attrvalue.entity";
import { Sku } from "../entities/sku.entity";
import { ApiProperty } from "@nestjs/swagger";

export class ProdSkuSelectDTO {
    @ApiProperty()
    attrSkuMap: Relation<Map<string, Relation<Sku>>>;
    @ApiProperty()
    attrvalueMap: Map<string, [ProdAttrvalue]>;  
}