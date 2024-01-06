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

import { DeleteWithTrashDto, PaginateDto } from '@/modules/restful/dtos';
import { Guest } from '@/modules/user/decorators';

import { ContentModule } from '../content.module';
import { UpdateCategoryDto } from '../dtos';
import { CategoryEntity } from '../entities';
import { CategoryService } from '../services';

const permission: PermissionChecker = async (ab) =>
    ab.can(PermissionAction.MANAGE, CategoryEntity.name);

@ApiTags('分类操作')
@Depends(ContentModule)
@Controller('categories')
export class CategoryController {
    constructor(protected service: CategoryService) {}

    /**
     * 查询分类树
     * @param options
     */
    @Get('tree')
    @SerializeOptions({ groups: ['category-tree'] })
    @Guest()
    async tree() {
        return this.service.findTrees({});
    }

    /**
     * 分页查询分类列表
     * @param options
     */
    @Get()
    @SerializeOptions({ groups: ['category-list'] })
    @Guest()
    async list(@Query() options: PaginateDto) {
        return this.service.paginate(options);
    }

    /**
     * 分页详解查询
     * @param id
     */
    @Get(':id')
    @SerializeOptions({ groups: ['category-detail'] })
    @Guest()
    async detail(
        @Param('id', new ParseUUIDPipe())
        id: string,
    ) {
        return this.service.detail(id);
    }

    /**
     * 更新分类
     * @param data
     */
    @Patch()
    @ApiBearerAuth()
    @SerializeOptions({ groups: ['category-detail'] })
    @Permission(permission)
    async update(
        @Body()
        data: UpdateCategoryDto,
    ) {
        return this.service.update(data);
    }

    /**
     * 批量删除分类
     * @param data
     */
    @Delete()
    @ApiBearerAuth()
    @SerializeOptions({ groups: ['category-list'] })
    @Permission(permission)
    async delete(
        @Body()
        data: DeleteWithTrashDto,
    ) {
        const { ids, trash } = data;
        return this.service.delete(ids, trash);
    }
}
