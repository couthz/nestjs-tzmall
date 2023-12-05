import { CustomRepository } from '@/common/database/decorators';
import { Sku } from './../entities/sku.entity';
import { BaseRepository } from '@/common/database/base';
import { CommonStatus, DeleteStatus } from '@/common/core/constants/enums';
@CustomRepository(Sku)
export class SkuRepository extends BaseRepository<Sku> {
    protected _qbName = 'sku';

    buildBaseQB() {
        return this.createQueryBuilder('sku');
    }

    async getSkuById(id: string): Promise<Sku> {
        return this.buildBaseQB()
            .where('sku.sku_id = :id', { id })
            .getOne();
    }

    async getSkusByProdId(prodId: string): Promise<Sku[]> {
        //取所有已启用且未删除的sku
        return await this.buildBaseQB()
            .where('sku.prod_id = :prodId', { prodId })
            .andWhere('sku.status = :status', { status: CommonStatus.ACTIVE })
            .andWhere('sku.is_delete = :isDelete', { isDelete: DeleteStatus.UnDeleted })
            .getMany();
    }
}