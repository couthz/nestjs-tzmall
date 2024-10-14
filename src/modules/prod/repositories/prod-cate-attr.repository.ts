import { CustomRepository } from "@/modules/database/decorators";
import { BaseRepository } from "@/modules/database/base";
import { ProdCateAttr } from "../entities";

@CustomRepository(ProdCateAttr)
export class ProdCateAttrRepository extends BaseRepository<ProdCateAttr> {
    protected _qbName = 'prodCateAttr';

    buildBaseQB() {
        return this.createQueryBuilder('prodCateAttr');
    }

    async getProdCateAttrList(categoryId: string): Promise<ProdCateAttr[]> {
        //将isMainAttr为1的记录排在第一个
        //注意mainAttr的id在所有属性名中一定最小,且最终sku的属性值组合一定是按照属性名的id从小到大排列的
        return this.buildBaseQB()
            .where('prodCateAttr.category_id = :categoryId', { categoryId })
            .andWhere('prodCateAttr.status = :status', { status: 1 })
            .orderBy('prodCateAttr.is_main_attr', 'DESC')
            .getMany();

    }
}