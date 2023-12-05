import { ProdCategory } from '../entities/prod-category.entity';
import { CustomRepository } from '@/common/database/decorators';

import { BaseProdRepository } from './base-prod.repository';
import { ProdStatus } from '../enums/prod.enum';
import { CommonStatus } from '@/common/core/constants/enums';

@CustomRepository(ProdCategory)
export class ProdCategoryRepository extends BaseProdRepository<ProdCategory> {
    protected _qbName = 'prodCategory';

    buildBaseQB() {
        return this.createQueryBuilder('prodCategory').orderBy('seq', 'DESC').where('prodCategory.status = :status', { status: CommonStatus.ACTIVE });
    }

    async listCategory(): Promise<ProdCategory[]> {
        return this.buildBaseQB().getMany();     
    }

    async listCategoryProd(): Promise<ProdCategory[]> {
        //prodTag,prod只查询需要的字段，所以都使用select
        return this.buildBaseQB()
            .leftJoinAndSelect('prodCategory.prods', 'prod')
            .addSelect(this.prodDesc)
            .where('prod.status = :status', { status: ProdStatus.ONLINE })
            .getMany();
    }
}
