import { ProdCategory } from '../entities/prod-category.entity';
import { CustomRepository } from '@/modules/database/decorators';

import { BaseProdRepository } from './base-prod.repository';
import { ProdStatus } from '../enums/prod.enum';
import { CommonStatus } from '@/modules/core/constants/enums';
import { ProdCategoryDescDTO } from '../dtos/prod-cate-desc.dto';

@CustomRepository(ProdCategory)
export class ProdCategoryRepository extends BaseProdRepository<ProdCategory> {
    protected _qbName = 'prodCategory';

    buildBaseQB() {
        return this.createQueryBuilder('prodCategory').orderBy('seq', 'DESC').where('prodCategory.status = :status', { status: CommonStatus.ACTIVE });
    }

    async listCategory(): Promise<ProdCategory[]> {
        return this.buildBaseQB().getMany();     
    }

    async listCategoryDesc(): Promise<ProdCategoryDescDTO[]> {
        //只查询category_id和category_name两个字段
        return this.buildBaseQB().getMany();
    }

    async listCategoryProd(): Promise<ProdCategory[]> {
        return this.buildBaseQB()
            .leftJoin('prodCategory.prods', 'prod')
            .addSelect(this.prodDesc)
            .where('prod.status = :status', { status: ProdStatus.ONLINE })
            .andWhere('prod.total_stocks > 0')
            .getMany();
    }


}
