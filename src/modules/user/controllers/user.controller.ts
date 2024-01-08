import { Controller, Get, Param, ParseUUIDPipe, Query, SerializeOptions } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';

import { IsNull, Not } from 'typeorm';

import { SelectTrashMode } from '@/modules/database/constants';
import { Depends } from '@/modules/restful/decorators';

import { Guest } from '../decorators';
import { AppQueryUserDto } from '../dtos';
import { UserService } from '../services';
import { UserModule } from '../user.module';

@ApiTags('用户查询')
@Depends(UserModule)
@Controller('users')
export class UserQueryController {
    constructor(protected service: UserService) {}

    /**
     * 查询用户列表
     */
    @Get()
    @SerializeOptions({ groups: ['user-list'] })
    @Guest()
    async list(
        @Query()
        options: AppQueryUserDto,
    ) {
        return this.service.paginate({
            ...options,
            isPublished: true,
            trashed: SelectTrashMode.NONE,
        });
    }

    /**
     * 查询用户信息
     * @param id
     */
    @Get(':id')
    @Guest()
    @SerializeOptions({ groups: ['user-detail'] })
    async detail(
        @Param('id', new ParseUUIDPipe())
        id: string,
    ) {
        return this.service.detail(id, async (qb) => qb.andWhere({ deletedAt: Not(IsNull()) }));
    }
}
