import { Controller, Get, Param, ParseUUIDPipe, Query, SerializeOptions } from '@nestjs/common';

import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

import { Depends } from '@/modules/restful/decorators';
import { PaginateWithTrashedDto } from '@/modules/restful/dtos';

import { RbacModule } from '../rbac.module';
import { RoleService } from '../services';

@ApiTags('角色信息')
@ApiBearerAuth()
@Depends(RbacModule)
@Controller('roles')
export class RoleController {
    constructor(protected service: RoleService) {}

    /**
     * 分页列表查询
     * @param options
     */
    @Get()
    @SerializeOptions({ groups: ['role-list'] })
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
    @SerializeOptions({ groups: ['role-detail'] })
    async detail(
        @Param('id', new ParseUUIDPipe())
        id: string,
    ) {
        return this.service.detail(id);
    }
}
