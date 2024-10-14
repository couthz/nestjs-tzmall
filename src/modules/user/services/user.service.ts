import { BaseService } from "@/modules/database/base";
import { Injectable } from "@nestjs/common";
import { User } from "../entities";
import { UserRepository } from "../repositories";
import { UpdateAvatarNickNameDTO } from "../dtos/update-avatar-nickName.dto";

@Injectable()
export class UserService extends BaseService<User, UserRepository>{
    
    constructor(protected repository: UserRepository){
        super(repository);
    }

    updateAvatarAndNickName(updateAvatarNickNameDTO: UpdateAvatarNickNameDTO, userId: string) {
        return this.repository.updateAvatarAndNickName(updateAvatarNickNameDTO, userId);
    }
}