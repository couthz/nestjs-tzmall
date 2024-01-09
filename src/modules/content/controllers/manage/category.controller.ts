import {
    Body,
    Controller,
    Delete,
    Get,
    Param,
    ParseUUIDPipe,
    Patch,
    Post,
    Query,
    SerializeOptions,
} from '@nestjs/common';

import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { PermissionAction } from '@/modules/rbac/constants';
import { Permission } from '@/modules/rbac/decorators';
import { PermissionChecker } from '@/modules/rbac/types';
import { Depends } from '@/modules/restful/decorators';

import { DeleteWithTrashDto, PaginateDto } from '@/modules/restful/dtos';

import { ContentModule } from '../../content.module';
import { CreateCategoryDto, UpdateCategoryDto } from '../../dtos';
import { CategoryEntity } from '../../entities';
import { CategoryService } from '../../services';

const permission: PermissionChecker = async (ab) =>
    ab.can(PermissionAction.MANAGE, CategoryEntity.name);

@ApiTags('分类管理')
@ApiBearerAuth()
@Depends(ContentModule)
@Controller('categories')
export class CategoryController {
    constructor(protected service: CategoryService) {}

    /**
     * 查询分类列表
     * @param options
     */
    @Get()
    @Permission(permission)
    @SerializeOptions({ groups: ['category-list'] })
    async list(@Query() options: PaginateDto) {
        return this.service.paginate(options);
    }

    /**
     * 分页详解查询
     * @param id
     */
    @Get(':id')
    @Permission(permission)
    @SerializeOptions({ groups: ['category-detail'] })
    async detail(
        @Param('id', new ParseUUIDPipe())
        id: string,
    ) {
        return this.service.detail(id);
    }

    /**
     * 新增分类
     * @param data
     */
    @Post()
    @Permission(permission)
    @SerializeOptions({ groups: ['category-detail'] })
    async store(@Body() data: CreateCategoryDto) {
        return this.service.create(data);
    }

    /**
     * 更新分类
     * @param data
     */
    @Patch()
    @Permission(permission)
    @SerializeOptions({ groups: ['category-detail'] })
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
    @Permission(permission)
    @SerializeOptions({ groups: ['category-list'] })
    async delete(
        @Body()
        data: DeleteWithTrashDto,
    ) {
        const { ids, trash } = data;
        return this.service.delete(ids, trash);
    }
}
