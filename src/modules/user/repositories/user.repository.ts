import { BaseRepository } from '@/modules/database/base';
import { CustomRepository } from '@/modules/database/decorators';

import { UserEntity } from '../entities/user.entity';

@CustomRepository(UserEntity)
export class UserRepository extends BaseRepository<UserEntity> {
    protected _qbName = 'user';

    buildBaseQuery() {
        return this.createQueryBuilder(this.qbName).orderBy(`${this.qbName}.createdAt`, 'DESC');
    }
}
