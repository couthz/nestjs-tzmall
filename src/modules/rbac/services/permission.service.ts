import { Injectable } from '@nestjs/common';

import { isNil } from 'lodash';
import { SelectQueryBuilder } from 'typeorm';

import { BaseService } from '@/modules/database/base';
import { QueryHook } from '@/modules/database/types';

import { QueryPermssionDto } from '../dtos';
import { PermissionEntity } from '../entities';
import { PermissionRepository } from '../repositories';

type FindParams = {
    [key in keyof Omit<QueryPermssionDto, 'limit' | 'page'>]: QueryPermssionDto[key];
};

@Injectable()
export class PermissionService extends BaseService<
    PermissionEntity,
    PermissionRepository,
    FindParams
> {
    constructor(protected permissionRepository: PermissionRepository) {
        super(permissionRepository);
    }

    protected async buildListQuery(
        queryBuilder: SelectQueryBuilder<PermissionEntity>,
        options: FindParams,
        callback?: QueryHook<PermissionEntity>,
    ) {
        const qb = await super.buildListQB(queryBuilder, options, callback);
        if (!isNil(options.role)) {
            qb.andWhere('roles.id IN (:...roles)', {
                roles: [options.role],
            });
        }
        return qb;
    }
}
