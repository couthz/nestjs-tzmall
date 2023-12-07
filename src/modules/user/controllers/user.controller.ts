import { Controller, Get, Param, ParseUUIDPipe, SerializeOptions } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { Depends } from '@/modules/restful/decorators';

import { UserService } from '../services';
import { UserModule } from '../user.module';

@ApiTags('用户信息')
@Depends(UserModule)
@Controller('users')
export class UserController {
    constructor(protected service: UserService) {}

    /**
     * 获取用户信息
     * @param id
     */
    @Get(':id')
    @SerializeOptions({ groups: ['user-detail'] })
    @ApiBearerAuth()
    async detail(
        @Param('id', new ParseUUIDPipe())
        id: string,
    ) {
        return this.service.detail(id);
    }
}
