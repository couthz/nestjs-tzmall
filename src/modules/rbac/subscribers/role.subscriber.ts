import { isNil } from 'lodash';

import { EventSubscriber } from 'typeorm';

import { BaseSubscriber } from '@/modules/database/base';

import { RoleEntity } from '../entities/role.entity';

@EventSubscriber()
export class RoleSubscriber extends BaseSubscriber<RoleEntity> {
    protected entity = RoleEntity;

    async afterLoad(entity: RoleEntity) {
        if (isNil(entity.label)) {
            entity.label = entity.name;
        }
    }
}
