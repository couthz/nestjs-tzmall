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

import { In, IsNull, Not } from 'typeorm';

import { SelectTrashMode } from '@/modules/database/constants';
import { PermissionAction } from '@/modules/rbac/constants';
import { Permission } from '@/modules/rbac/decorators';
import { checkOwnerPermission } from '@/modules/rbac/helpers';
import { PermissionChecker } from '@/modules/rbac/types';
import { Depends } from '@/modules/restful/decorators';
import { DeleteWithTrashDto, RestoreDto } from '@/modules/restful/dtos';

import { Guest, ReqUser } from '@/modules/user/decorators';

import { UserEntity } from '@/modules/user/entities';

import { ContentModule } from '../content.module';
import { CreateUserPostDto, QueryFrontendPostDto, QueryOwnerPostDto, UpdatePostDto } from '../dtos';
import { PostEntity } from '../entities';
import { PostRepository } from '../repositories';
import { PostService } from '../services/post.service';

const permissions: Record<'create' | 'owner', PermissionChecker> = {
    create: async (ab) => ab.can(PermissionAction.CREATE, PostEntity.name),
    owner: async (ab, ref, request) =>
        checkOwnerPermission(ab, {
            request,
            getData: async (items) =>
                ref.get(PostRepository, { strict: false }).find({
                    relations: ['author'],
                    where: { id: In(items) },
                }),
        }),
};

@ApiTags('文章操作')
@Depends(ContentModule)
@Controller('posts')
export class PostController {
    constructor(protected service: PostService) {}

    /**
     * 查询文章列表
     * @param options
     */
    @Get()
    @SerializeOptions({ groups: ['post-list'] })
    @Guest()
    async list(
        @Query()
        options: QueryFrontendPostDto,
    ) {
        return this.service.paginate({
            ...options,
            isPublished: true,
            trashed: SelectTrashMode.NONE,
        });
    }

    /**
     * 分页查询自己发布的文章列表
     * @param options
     */
    @Get('onwer')
    @ApiBearerAuth()
    @SerializeOptions({ groups: ['post-list'] })
    async listOwner(
        @Query()
        options: QueryOwnerPostDto,
        @ReqUser() author: ClassToPlain<UserEntity>,
    ) {
        return this.service.paginate({
            ...options,
            author: author.id,
        });
    }

    /**
     * 查询文章详情
     * @param id
     */
    @Get(':id')
    @SerializeOptions({ groups: ['post-detail'] })
    @Guest()
    async detail(
        @Param('id', new ParseUUIDPipe())
        id: string,
    ) {
        return this.service.detail(id, async (qb) =>
            qb.andWhere({ publishedAt: Not(IsNull()), deletedAt: Not(IsNull()) }),
        );
    }

    /**
     * 查询自己发布的文章详情
     * @param id
     */
    @Get('owner/:id')
    @ApiBearerAuth()
    @SerializeOptions({ groups: ['post-detail'] })
    @Permission(permissions.owner)
    async detailOwner(
        @Param('id', new ParseUUIDPipe())
        id: string,
    ) {
        return this.service.detail(id, async (qb) => qb.withDeleted());
    }

    /**
     * 新增文章
     * @param data
     */
    @Post()
    @ApiBearerAuth()
    @SerializeOptions({ groups: ['post-detail'] })
    @Permission(permissions.create)
    async store(
        @Body()
        data: CreateUserPostDto,
        @ReqUser() author: ClassToPlain<UserEntity>,
    ) {
        return this.service.create(data, author);
    }

    /**
     * 更新自己发布的文章
     * @param data
     */
    @Patch()
    @ApiBearerAuth()
    @SerializeOptions({ groups: ['post-detail'] })
    @Permission(permissions.owner)
    async update(
        @Body()
        data: UpdatePostDto,
    ) {
        return this.service.update(data);
    }

    /**
     * 批量删除自己发布的文章
     * @param data
     */
    @Delete()
    @ApiBearerAuth()
    @SerializeOptions({ groups: ['post-list'] })
    @Permission(permissions.owner)
    async delete(
        @Body()
        data: DeleteWithTrashDto,
    ) {
        const { ids, trash } = data;
        return this.service.delete(ids, trash);
    }

    /**
     * 批量恢复自己发布的文章
     * @param data
     */
    @Patch('restore')
    @ApiBearerAuth()
    @SerializeOptions({ groups: ['post-list'] })
    @Permission(permissions.owner)
    async restore(
        @Body()
        data: RestoreDto,
    ) {
        const { ids } = data;
        return this.service.restore(ids);
    }
}
