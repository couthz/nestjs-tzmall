import {
    Controller,
    Get,
    Query,
    SerializeOptions,
    Param,
    ParseUUIDPipe,
    Patch,
    Delete,
    Post,
    Body,
} from '@nestjs/common';

import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { PermissionAction } from '@/modules/rbac/constants';
import { Permission } from '@/modules/rbac/decorators';
import { PermissionChecker } from '@/modules/rbac/types';
import { Depends } from '@/modules/restful/decorators';

import { DeleteWithTrashDto, PaginateWithTrashedDto } from '@/modules/restful/dtos';

import { Guest } from '@/modules/user/decorators';

import { ContentModule } from '../content.module';
import { CreateTagDto, UpdateTagDto } from '../dtos';
import { TagEntity } from '../entities';
import { TagService } from '../services';

const permission: PermissionChecker = async (ab) => ab.can(PermissionAction.MANAGE, TagEntity.name);

@ApiTags('标签操作')
@Depends(ContentModule)
@Controller('tags')
export class TagController {
    constructor(protected service: TagService) {}

    /**
     * 分页查询标签列表
     * @param options
     */
    @Get()
    @SerializeOptions({})
    @Guest()
    async list(
        @Query()
        options: PaginateWithTrashedDto,
    ) {
        return this.service.paginate(options);
    }

    /**
     * 查询标签详情
     * @param id
     */
    @Get(':id')
    @SerializeOptions({})
    @Guest()
    async detail(
        @Param('id', new ParseUUIDPipe())
        id: string,
    ) {
        return this.service.detail(id);
    }

    /**
     * 添加新标签
     * @param data
     */
    @Post()
    @ApiBearerAuth()
    @SerializeOptions({})
    @Permission(permission)
    async store(
        @Body()
        data: CreateTagDto,
    ) {
        return this.service.create(data);
    }

    /**
     * 更新标签
     * @param data
     */
    @Patch()
    @ApiBearerAuth()
    @SerializeOptions({})
    @Permission(permission)
    async update(
        @Body()
        data: UpdateTagDto,
    ) {
        return this.service.update(data);
    }

    /**
     * 批量删除标签
     * @param data
     */
    @Delete()
    @ApiBearerAuth()
    @SerializeOptions({})
    @Permission(permission)
    async delete(
        @Body()
        data: DeleteWithTrashDto,
    ) {
        const { ids, trash } = data;
        return this.service.delete(ids, trash);
    }
}
