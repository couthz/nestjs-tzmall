import { CustomRepository } from "@/common/database/decorators";
import { BaseRepository } from "@/common/database/base";
import { ShopcartItem } from "../entities";

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
    
    async getShopcartItemsAndProdsByUserId(userId: string): Promise<ShopcartItem[]> {
        //查询shopcartItem以及关联的prod和sku
        return this.buildBaseQB()
            .leftJoinAndSelect('shopcartItem.sku', 'sku')
            .addSelect(['sku.prodId','sku.skuId','sku.skuName', 'sku.pic','sku.ori_price','sku.price'])
            .where('shopcartItem.user_id = :userId', { userId })
            .getMany();
    }

    //利用id列表查询出所有的shopcartItem以及关联的sku
    async getShopcartItemsAndProdsByIds(ids: string[]): Promise<ShopcartItem[]> {
        return this.buildBaseQB()
            .leftJoinAndSelect('shopcartItem.sku', 'sku')
            .addSelect(['sku.prodId','sku.skuId','sku.skuName', 'sku.pic','sku.ori_price','sku.price'])
            .where('shopcartItem.shopcart_item_id IN (:...ids)', { ids })
            .getMany();
    }

    async deleteShopcartItemById(id: string): Promise<void> {
        await this.buildBaseQB()
            .delete()
            .where('shopcart_item_id = :shopcart_item_id', { id })
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
            .where('shopcartItem.shopcart_item_id = :id', { id: shopcartItem.shopcartItemId })
            .execute();
    }



}