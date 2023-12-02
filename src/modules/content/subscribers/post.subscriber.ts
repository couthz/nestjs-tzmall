import { isNil } from 'lodash';
import { EventSubscriber } from 'typeorm';

import { BaseSubscriber } from '@/modules/database/base';

import { PostBodyType } from '../constants';
import { PostEntity } from '../entities';
import { SanitizeService } from '../services/sanitize.service';

@EventSubscriber()
export class PostSubscriber extends BaseSubscriber<PostEntity> {
    protected entity = PostEntity;

    /**
     * 加载文章数据的处理
     * @param entity
     */
    async afterLoad(entity: PostEntity) {
        const sanitizeService = (await this.configure.get('content.htmlEnabled'))
            ? this.container.get(SanitizeService)
            : undefined;
        if (!isNil(sanitizeService) && entity.type === PostBodyType.HTML) {
            entity.body = sanitizeService.sanitize(entity.body);
        }
    }
}
