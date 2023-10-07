import { Optional } from '@nestjs/common';
import { isNil } from 'lodash';
import { DataSource, EventSubscriber } from 'typeorm';

import { Configure } from '@/modules/config/configure';
import { BaseSubscriber } from '@/modules/database/base';

import { PostBodyType } from '../constants';
import { PostEntity } from '../entities';
import { PostRepository } from '../repositories';
import { SanitizeService } from '../services/sanitize.service';

@EventSubscriber()
export class PostSubscriber extends BaseSubscriber<PostEntity> {
    protected entity = PostEntity;

    constructor(
        protected dataSource: DataSource,
        protected postRepository: PostRepository,
        protected configure: Configure,
        @Optional() protected sanitizeService?: SanitizeService,
    ) {
        super(dataSource);
    }

    listenTo() {
        return PostEntity;
    }

    /**
     * 加载文章数据的处理
     * @param entity
     */
    async afterLoad(entity: PostEntity) {
        if (
            (await this.configure.get('content.htmlEnabled')) &&
            !isNil(this.sanitizeService) &&
            entity.type === PostBodyType.HTML
        ) {
            entity.body = this.sanitizeService.sanitize(entity.body);
        }
    }
}
