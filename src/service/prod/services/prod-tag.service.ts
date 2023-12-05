import { Injectable } from '@nestjs/common';

import { BaseService } from '@/common/database/base';

import { ProdTag } from '../entities/prod-tag.entity';
import { ProdTagRepository } from '../repositories/prod-tag.repository';

@Injectable()
export class ProdTagService extends BaseService<ProdTag, ProdTagRepository> {
    constructor(protected repository: ProdTagRepository) {
        super(repository);
    }

    async listTagProd(): Promise<Partial<ProdTag>[]> {
        return this.repository.listTagProd();
    }
}
