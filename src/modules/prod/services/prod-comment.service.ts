import { Injectable } from '@nestjs/common';

import { BaseService } from '@/modules/database/base';

import { ProdComment } from '../entities/prod-comment.entity';

import { ProdCommentRepository } from '../repositories/prod-comment.repository';
import { PaginateReturn } from '@/modules/database/types';
import { GetProdCommentPageDTO } from '../dtos/get-prod-comment-page.dto';
import { SelectQueryBuilder } from 'typeorm';

@Injectable()
export class ProdCommentService extends BaseService<ProdComment, ProdCommentRepository> {
    constructor(protected repository: ProdCommentRepository) {
        super(repository);
    }

    async getProdCommentPage(
        requestParams: GetProdCommentPageDTO,
    ): Promise<PaginateReturn<ProdComment>> {
        const { prodId } = requestParams;

        const addQuery = async (qb: SelectQueryBuilder<ProdComment>) => {

            //查询所有列(单表查询,不做任何join),同时如果is_anonymous列的值为1,则将nick_name列修改为"匿名用户"
            qb.where('prodComment.prod_id = :prodId', { prodId });
            qb.andWhere('prodComment.status = 1');
            qb.orderBy('prodComment.rec_time', 'DESC');

            return qb;
        };

        return await super.paginate(requestParams, addQuery);
    }
}