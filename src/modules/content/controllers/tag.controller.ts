import { Controller, Get, Query, SerializeOptions, Param, ParseUUIDPipe } from '@nestjs/common';

import { ApiTags } from '@nestjs/swagger';

import { Depends } from '@/modules/restful/decorators';

import { PaginateDto } from '@/modules/restful/dtos';

import { Guest } from '@/modules/user/decorators';

import { ContentModule } from '../content.module';
import { TagService } from '../services';

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
        options: PaginateDto,
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
}
