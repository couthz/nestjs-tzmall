//模仿auth.controller.ts，创建user.controller.ts
import { ApiTags } from "@nestjs/swagger";
import { UserModule } from "../user.module";
import { Depends } from "@/modules/restful/decorators";
import { Body, Controller, Post } from "@nestjs/common";

import { UserService } from "../services/user.service";
import { UpdateAvatarNickNameDTO } from "../dtos/update-avatar-nickName.dto";
import { CurrentUserId } from "@/modules/core/decorators/current-user-id.decorator";
@ApiTags('用户管理')
@Depends(UserModule)
@Controller('user')
export class UserController {

    constructor(protected service: UserService) {}

    @Post('updateAvatarAndNickName')
    async updateAvatarAndNickName(@Body() updateAvatarNickNameDTO:UpdateAvatarNickNameDTO, @CurrentUserId() userId: string) {
        return await this.service.updateAvatarAndNickName(updateAvatarNickNameDTO, userId);
    }

}
