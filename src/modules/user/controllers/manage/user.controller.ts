import {
    Body,
    Controller,
    Delete,
    Get,
    Param,
    ParseUUIDPipe,
    Patch,
    Query,
    SerializeOptions,
} from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { PermissionAction } from '@/modules/rbac/constants';
import { Permission } from '@/modules/rbac/decorators';
import { PermissionChecker } from '@/modules/rbac/types';
import { Depends } from '@/modules/restful/decorators';

import { DeleteWithTrashDto, RestoreDto } from '@/modules/restful/dtos';

import { QueryUserDto } from '../../dtos';
import { UserEntity } from '../../entities';
import { UserService } from '../../services';
import { UserModule } from '../../user.module';

const permission: PermissionChecker = async (ab) =>
    ab.can(PermissionAction.MANAGE, UserEntity.name);

@ApiTags('用户管理')
@ApiBearerAuth()
@Depends(UserModule)
@Controller('users')
export class UserController {
    constructor(protected service: UserService) {}

    /**
     * 查询用户列表
     */
    @Get()
    @Permission(permission)
    @SerializeOptions({ groups: ['user-list'] })
    async list(
        @Query()
        options: QueryUserDto,
    ) {
        return this.service.paginate(options);
    }

    /**
     * 获取用户信息
     * @param id
     */
    @Get(':id')
    @Permission(permission)
    @SerializeOptions({ groups: ['user-detail'] })
    async detail(
        @Param('id', new ParseUUIDPipe())
        id: string,
    ) {
        return this.service.detail(id);
    }

    /**
     * 批量删除用户
     * @param data
     */
    @Delete()
    @SerializeOptions({ groups: ['user-list'] })
    @Permission(permission)
    async delete(
        @Body()
        data: DeleteWithTrashDto,
    ) {
        const { ids, trash } = data;
        return this.service.delete(ids, trash);
    }

    /**
     * 批量恢复用户
     * @param data
     */
    @Patch('restore')
    @SerializeOptions({ groups: ['user-list'] })
    @Permission(permission)
    async restore(
        @Body()
        data: RestoreDto,
    ) {
        const { ids } = data;
        return this.service.restore(ids);
    }
}
