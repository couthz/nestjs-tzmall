import { CustomRepository } from "@/modules/database/decorators";
import { BaseRepository } from "@/modules/database/base";
import { ProdAttrvalue } from "../entities/prod-attrvalue.entity";
import { ProdCateAttr } from "../entities";

@CustomRepository(ProdAttrvalue)
export class ProdAttrvalueRepository extends BaseRepository<ProdAttrvalue> {

    protected _qbName = 'prodAttrvalue';

    buildBaseQB() {
        return this.createQueryBuilder('prodAttrvalue');
    }

    async getAttrvalueByAttrAndProdId(prodCateAttrList: ProdCateAttr[], prodId: string): Promise<ProdAttrvalue[]> {
        //根据prodId和prodCateAttrList中的attrId查询出所有的attrvalue
        console.log(prodCateAttrList);
        const attrIdList = prodCateAttrList.map((prodCateAttr) => prodCateAttr.attrId);
        return this.buildBaseQB()
            .where('prodAttrvalue.prod_id = :prodId', { prodId })
            .andWhere('prodAttrvalue.attr_id IN (:...attrIdList)', { attrIdList })
            .getMany();

    }

    async removeByProdId(prodId: string) {
        //使用remove函数,根据prodId删除所有的记录
        await this.delete({ prodId:prodId }); 
    }
}