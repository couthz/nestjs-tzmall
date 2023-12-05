import { CustomRepository } from '@/common/database/decorators';

import { ProdTag } from '../entities/prod-tag.entity';
import { BaseProdRepository } from './base-prod.repository';
import { ProdStatus } from '../enums/prod.enum';
import { CommonStatus } from '@/common/core/constants/enums';

@CustomRepository(ProdTag)
export class ProdTagRepository extends BaseProdRepository<ProdTag> {
    protected _qbName = 'prodTag';

    buildBaseQB() {
        return this.createQueryBuilder('prodTag').orderBy('seq', 'DESC').select(['prodTag.id', 'prodTag.title', 'prodTag.is_default', 'prodTag.prod_count', 'prodTag.style', 'prodTag.seq']).where('prodTag.status = :status', { status: CommonStatus.ACTIVE });
    }

    async listTagProd(): Promise<Partial<ProdTag>[]> {
        //prodTag,prod只查询需要的字段，所以都使用select
        return this.buildBaseQB()
            .leftJoinAndSelect('prodTag.prods', 'prod')
            .addSelect(this.prodDesc)
            .where('prod.status = :status', { status: ProdStatus.ONLINE })
            .getMany();
    }
}
