import { BaseRepository } from "@/modules/database/base";
import { CustomRepository } from "@/modules/database/decorators";
import { User } from "../entities/user.entity";
import { UpdateAvatarNickNameDTO } from "../dtos/update-avatar-nickName.dto";

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
            .where('user.open_id = :openId', { openId })
            .getOne();

        if (!user) {
            user = await this.create({ openId });
        }

        await this.save(user);

        return user;
    }

    async getOpenIdByUserId(userId: string): Promise<string> {
        //通过userId查询openId
        const user = await this.buildBaseQB()
            .where('user.user_id = :userId', { userId })
            .getOne();
        return user.openId;
    }

    updateAvatarAndNickName(updateAvatarNickNameDTO: UpdateAvatarNickNameDTO, userId: string) {
        //更新用户头像和昵称
        return this.buildBaseQB()
            .update()
            .set(updateAvatarNickNameDTO)
            .where('user_id = :userId', { userId })
            .execute();
    }

}
