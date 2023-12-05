import { isNil } from 'lodash';
import { FindTreeOptions, SelectQueryBuilder } from 'typeorm';

import { BaseTreeRepository } from '@/common/database/base';
import { CustomRepository } from '@/common/database/decorators';

import { QueryParams } from '@/common/database/types';

import { CommentEntity } from '../entities';

@CustomRepository(CommentEntity)
export class CommentRepository extends BaseTreeRepository<CommentEntity> {
    protected _qbName = 'comment';

    protected orderBy = 'createdAt';

    /**
     * 构建基础查询器
     */
    buildBaseQB(qb: SelectQueryBuilder<CommentEntity>): SelectQueryBuilder<CommentEntity> {
        return super.buildBaseQB(qb).leftJoinAndSelect(`${this.qbName}.post`, 'post');
    }

    async findTrees(
        options: FindTreeOptions & QueryParams<CommentEntity> & { post?: string } = {},
    ): Promise<CommentEntity[]> {
        return super.findTrees({
            ...options,
            addQuery: async (qb) => {
                return isNil(options.post) ? qb : qb.where('post.id = :id', { id: options.post });
            },
        });
    }
}
