import { BaseRepository } from '@/modules/database/base';
import { CustomRepository } from '@/modules/database/decorators';

import { RoleEntity } from '../entities/role.entity';

@CustomRepository(RoleEntity)
export class RoleRepository extends BaseRepository<RoleEntity> {
    protected _qbName = 'role';

    buildBaseQuery() {
        return this.createQueryBuilder(this.qbName).leftJoinAndSelect(
            `${this.qbName}.permissions`,
            'permssions',
        );
    }
}
