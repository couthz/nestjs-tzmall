import { BaseRepository } from "@/common/database/base";
import { CustomRepository } from "@/common/database/decorators";
import { User } from "../entities/user.entity";

@CustomRepository(User)
export class UserRepository extends BaseRepository<User> {
    protected _qbName = "user";
    // Custom methods and queries can be added here
    buildBaseQB() {
        return this.createQueryBuilder('user');
    }

    //根据OpenID创建或查询用户
    async getOrCreateUserByOpenId(openId: string): Promise<User> {
        let user = await this.buildBaseQB()
            .where('user.openId = :openId', { openId })
            .getOne();

        if (!user) {
            user = await this.create({ openId });
        }

        await this.save(user);

        return user;
    }

}
