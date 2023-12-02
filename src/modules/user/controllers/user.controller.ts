import {
    Body,
    Controller,
    Delete,
    Get,
    Param,
    ParseUUIDPipe,
    Patch,
    Post,
    SerializeOptions,
} from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { Depends } from '@/modules/restful/decorators';

import { DeleteWithTrashDto, RestoreDto } from '@/modules/restful/dtos';

import { Guest } from '../decorators';
import { CreateUserDto, UpdateUserDto } from '../dtos';
import { UserService } from '../services';
import { UserModule } from '../user.module';

@ApiTags('用户管理')
@Depends(UserModule)
@Controller('users')
export class UserController {
    constructor(protected service: UserService) {}

    /**
     * 用户列表
     */
    @Get()
    @Guest()
    @SerializeOptions({ groups: ['user-list'] })
    async list() {
        return this.service.list();
    }

    /**
     * 获取用户信息
     * @param id
     */
    @Get(':id')
    @Guest()
    @SerializeOptions({ groups: ['user-detail'] })
    async detail(
        @Param('id', new ParseUUIDPipe())
        id: string,
    ) {
        return this.service.detail(id);
    }

    /**
     * 新增用户
     * @param data
     */
    @Post()
    @SerializeOptions({ groups: ['user-detail'] })
    @ApiBearerAuth()
    async store(
        @Body()
        data: CreateUserDto,
    ) {
        return this.service.create(data);
    }

    /**
     * 更新用户信息
     * @param data
     */
    @Patch(':id')
    @SerializeOptions({ groups: ['user-detail'] })
    @ApiBearerAuth()
    async update(
        @Body()
        data: UpdateUserDto,
    ) {
        return this.service.update(data);
    }

    /**
     * 批量删除用户
     * @param data
     */
    @Delete()
    @SerializeOptions({ groups: ['user-list'] })
    @ApiBearerAuth()
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
    @ApiBearerAuth()
    async restore(
        @Body()
        data: RestoreDto,
    ) {
        const { ids } = data;
        return this.service.restore(ids);
    }
}
