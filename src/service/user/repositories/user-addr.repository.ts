import { CustomRepository } from "@/common/database/decorators";
import { UserAddr } from "../entities";
import { BaseRepository } from "@/common/database/base";

@CustomRepository(UserAddr)
export class UserAddrRepository extends BaseRepository<UserAddr> {
    protected _qbName = "userAddr";
    // Custom methods and queries can be added here
    buildBaseQB() {
        return this.createQueryBuilder('userAddr');
    }

    async findDefalutAddrByUserId(userId: string): Promise<UserAddr> {
        return this.buildBaseQB()
            .where('userAddr.user_id = :userId', { userId })
            .andWhere('userAddr.common_addr = 1')
            .getOne();
    }
}
