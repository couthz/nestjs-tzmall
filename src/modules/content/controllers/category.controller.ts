import { resolve } from 'path';

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

import { ApiTags } from '@nestjs/swagger';

import { readFileSync } from 'fs-extra';

import { Depends } from '@/modules/restful/decorators';
import { DeleteWithTrashDto, PaginateWithTrashedDto, RestoreDto } from '@/modules/restful/dtos';

import { ContentModule } from '../content.module';
import { CreateCategoryDto, QueryCategoryTreeDto, UpdateCategoryDto } from '../dtos';
import { CategoryService } from '../services';

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
    async tree(@Query() options: QueryCategoryTreeDto) {
        // return 'ddd';
        const data = readFileSync(resolve(__dirname, '../../../assets/ccc.txt'), 'utf8');
        return data;
        return this.service.findTrees(options);
    }

    /**
     * 分页查询分类列表
     * @param options
     */
    @Get()
    @SerializeOptions({ groups: ['category-list'] })
    async list(
        @Query()
        options: PaginateWithTrashedDto,
    ) {
        return this.service.paginate(options);
    }

    /**
     * 分页详解查询
     * @param id
     */
    @Get(':id')
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
    @SerializeOptions({ groups: ['category-detail'] })
    async store(
        @Body()
        data: CreateCategoryDto,
    ) {
        return this.service.create(data);
    }

    /**
     * 更新分类
     * @param data
     */
    @Patch()
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
    @SerializeOptions({ groups: ['category-list'] })
    async delete(
        @Body()
        data: DeleteWithTrashDto,
    ) {
        const { ids, trash } = data;
        return this.service.delete(ids, trash);
    }

    /**
     * 批量恢复分类
     * @param data
     */
    @Patch('restore')
    @SerializeOptions({ groups: ['category-list'] })
    async restore(
        @Body()
        data: RestoreDto,
    ) {
        const { ids } = data;
        return this.service.restore(ids);
    }
}
