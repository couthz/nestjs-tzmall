import { Controller, Get, Param, ParseUUIDPipe, Query, SerializeOptions } from '@nestjs/common';

import { ApiTags } from '@nestjs/swagger';

import { Depends } from '@/modules/restful/decorators';
import { PaginateWithTrashedDto } from '@/modules/restful/dtos';

import { Guest } from '@/modules/user/decorators';

import { RbacModule } from '../rbac.module';
import { RoleService } from '../services';

@ApiTags('角色管理')
@Depends(RbacModule)
@Controller('roles')
export class RoleController {
    constructor(protected service: RoleService) {}

    /**
     * 角色列表查询
     * @param options
     */
    @Get()
    @SerializeOptions({ groups: ['role-list'] })
    @Guest()
    async list(
        @Query()
        options: PaginateWithTrashedDto,
    ) {
        return this.service.paginate(options);
    }

    /**
     * 角色详解查询
     * @param id
     */
    @Get(':id')
    @SerializeOptions({ groups: ['role-detail'] })
    @Guest()
    async detail(
        @Param('id', new ParseUUIDPipe())
        id: string,
    ) {
        return this.service.detail(id);
    }
}
