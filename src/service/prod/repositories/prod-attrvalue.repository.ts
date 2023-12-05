import { CustomRepository } from "@/common/database/decorators";
import { BaseRepository } from "@/common/database/base";
import { ProdAttrvalue } from "../entities/prod-attrvalue.entity";

@CustomRepository(ProdAttrvalue)
export class ProdAttrvalueRepository extends BaseRepository<ProdAttrvalue> {
    protected _qbName = 'prodAttrvalue';

    buildBaseQB() {
        return this.createQueryBuilder('prodAttrvalue');
    }

    async getAttrvalueByProdId(prodId: string): Promise<ProdAttrvalue[]> {
        return this.buildBaseQB()
            .where('prodAttrvalue.prod_id = :prodId', { prodId })
            .getMany();
    }
}