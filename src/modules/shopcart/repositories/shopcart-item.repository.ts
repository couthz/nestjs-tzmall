import { CustomRepository } from "@/modules/database/decorators";
import { BaseRepository } from "@/modules/database/base";
import { ShopcartItem } from "../entities";
import { ChangeItemCheckedDTO } from "../dtos/change-item-checked.dto";

@CustomRepository(ShopcartItem)
export class ShopcartItemRepository extends BaseRepository<ShopcartItem> {
    

   


    protected _qbName = 'shopcartItem';

    buildBaseQB() {
        return this.createQueryBuilder('shopcartItem');
    }

    async getShopcartItemsByUserId(userId: string): Promise<ShopcartItem[]> {
        return this.buildBaseQB()
            .where('shopcartItem.user_id = :userId', { userId })
            .getMany();
    }

    async getShopcartProdCount(userId: string):Promise<number> {
        //计算并返回购物车中的商品总数:
        //取出userId对应的所有shopcartItem记录,并且累加itemCount
        const prodCount = await this.buildBaseQB()
            .select('SUM(shopcartItem.itemCount)', 'total')
            .where('shopcartItem.user_id = :userId', { userId })
            .getRawOne();
        return prodCount;

    }
    
    async getShopcartItemsAndProdsByUserId(userId: string): Promise<ShopcartItem[]> {
        //查询shopcartItem以及关联的prod和sku
        return this.buildBaseQB()
            .leftJoin('shopcartItem.sku', 'sku')
            .addSelect(['sku.prodId','sku.categoryId','sku.prodName','sku.skuId','sku.skuName', 'sku.pic','sku.oriPrice','sku.price','sku.attr'])
            .where('shopcartItem.user_id = :userId', { userId })
            .where('shopcartItem.is_valid=1')
            .getMany();
    }

    //利用id列表查询出所有的shopcartItem以及关联的sku
    async getShopcartItemsAndProdsByIds(ids: string[]): Promise<ShopcartItem[]> {
        return this.buildBaseQB()
            .leftJoin('shopcartItem.sku', 'sku')
            .addSelect(['sku.prodId','sku.categoryId','sku.prodName','sku.skuId','sku.skuName', 'sku.pic','sku.oriPrice','sku.price'])
            .where('shopcartItem.shopcart_item_id IN (:...ids)', { ids })
            .getMany();
    }

    async getCheckedShopcartItemsByUserId(userId: string): Promise<ShopcartItem[]> {
        return this.buildBaseQB()
            .leftJoin('shopcartItem.sku', 'sku')
            .addSelect(['sku.prodId','sku.categoryId','sku.prodName','sku.skuId','sku.skuName', 'sku.pic','sku.oriPrice','sku.price'])
            .where('shopcartItem.user_id = :userId', { userId })
            .where('shopcartItem.is_valid=1')
            .where('shopcartItem.is_checked=1')
            .getMany();
    }

    async deleteShopcartItemById(shopcartItemId: string): Promise<void> {
        await this.buildBaseQB()
            .delete()
            .where('shopcart_item_id = :shopcartItemId', { shopcartItemId })
            .execute();
    }

    async deleteShopcartItemsByIds(ids: string[]): Promise<void> {
        await this.buildBaseQB()
            .delete()
            .where('shopcart_item_id IN (:...ids)', { ids })
            .execute();
    }

    async updateShopcartItem(shopcartItem: ShopcartItem): Promise<void> {
        await this.buildBaseQB()
            .update()
            .set(shopcartItem)
            .where('shopcart_item_id = :id', { id: shopcartItem.shopcartItemId })
            .execute();
    }

    async deleteShopcartItemBySkuId(oriSkuId: string) {
        await this.buildBaseQB()
            .delete()
            .where('sku_id = :sku_id', { sku_id: oriSkuId })
            .execute();
    }

    async getShopcartItemsBySkuId(skuId: string): Promise<ShopcartItem>{
        return await this.buildBaseQB()
            .where('sku_id = :sku_id', { sku_id: skuId })
            .getOne();
    }

    async changeItemChecked(changeItemCheckedDTO: ChangeItemCheckedDTO) {
        //批量修改shopcartItem的isChecked字段
        await this.buildBaseQB()
            .update()
            .set({ isChecked: changeItemCheckedDTO.isChecked })
            .where('shopcart_item_id IN (:...shopcartItemIds)', { shopcartItemIds: changeItemCheckedDTO.shopcartItemIds })
            .execute();
    }




}