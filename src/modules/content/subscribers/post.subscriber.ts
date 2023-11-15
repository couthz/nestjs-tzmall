import { isNil } from 'lodash';
import { EventSubscriber } from 'typeorm';

import { Configure } from '@/modules/config/configure';
import { app } from '@/modules/core/helpers';
import { BaseSubscriber } from '@/modules/database/base';

import { PostBodyType } from '../constants';
import { PostEntity } from '../entities';
import { SanitizeService } from '../services/sanitize.service';

@EventSubscriber()
export class PostSubscriber extends BaseSubscriber<PostEntity> {
    protected entity = PostEntity;

    listenTo() {
        return PostEntity;
    }

    /**
     * 加载文章数据的处理
     * @param entity
     */
    async afterLoad(entity: PostEntity) {
        const configure = app.container.get(Configure, { strict: false });
        const sanitizeService = app.container.get(SanitizeService, { strict: false });
        if (
            (await configure.get('content.htmlEnabled')) &&
            !isNil(sanitizeService) &&
            entity.type === PostBodyType.HTML
        ) {
            entity.body = sanitizeService.sanitize(entity.body);
        }
    }
}
