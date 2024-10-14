import { ProdComment } from './../entities/prod-comment.entity';
//模仿sku.repository.ts生成prod-comment.repository.ts
import { CustomRepository } from '@/modules/database/decorators';
import { BaseRepository } from '@/modules/database/base';

@CustomRepository(ProdComment)
export class ProdCommentRepository extends BaseRepository<ProdComment> {
    protected _qbName = 'prodComment';

    buildBaseQB() {
        return this.createQueryBuilder('prodComment');
    }

    async getProdCommentList(prodId: string): Promise<ProdComment[]> {
        return this.buildBaseQB()
            .where('prodComment.prod_id = :prodId', { prodId })
            .getMany();
    }
}

