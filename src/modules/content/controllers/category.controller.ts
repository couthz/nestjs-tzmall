import { Controller, Get, Param, ParseUUIDPipe, Query, SerializeOptions } from '@nestjs/common';

import { ApiTags } from '@nestjs/swagger';

import { Depends } from '@/modules/restful/decorators';

import { PaginateDto } from '@/modules/restful/dtos';
import { Guest } from '@/modules/user/decorators';

import { ContentModule } from '../content.module';
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
}
