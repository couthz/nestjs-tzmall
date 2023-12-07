import { PickType } from '@nestjs/swagger';
import { Transform } from 'class-transformer';

import { IsDefined, IsNotEmpty, IsOptional, IsUUID, MaxLength, ValidateIf } from 'class-validator';

import { DtoValidation } from '@/modules/core/decorators';
import { IsDataExist } from '@/modules/database/constraints';

import { PaginateDto } from '@/modules/restful/dtos';

import { UserEntity } from '@/modules/user/entities';

import { PostEntity } from '../entities';

/**
 * 评论分页查询验证
 */
@DtoValidation({ type: 'query' })
export class QueryCommentDto extends PaginateDto {
    /**
     * 评论发布者ID:根据传入评论发布者的ID对评论进行过滤
     */
    @IsDataExist(UserEntity, {
        message: '所属的用户不存在',
    })
    @IsUUID(undefined, { message: '用户ID格式错误' })
    @IsOptional()
    user?: string;

    /**
     * 所属文章ID
     */
    @IsDataExist(PostEntity, {
        message: '文章不存在',
    })
    @IsUUID(undefined, { message: 'ID格式错误' })
    @IsOptional()
    post?: string;
}

/**
 * 评论树查询
 */
@DtoValidation({ type: 'query' })
export class QueryCommentTreeDto extends PickType(QueryCommentDto, ['post']) {}

/**
 * 评论添加验证
 */
@DtoValidation()
export class CreateCommentDto {
    /**
     * 评论内容
     */
    @MaxLength(1000, { message: '评论内容不能超过$constraint1个字' })
    @IsNotEmpty({ message: '评论内容不能为空' })
    body: string;

    /**
     * 所属文章ID
     */
    @IsDataExist(PostEntity, {
        message: '文章不存在',
    })
    @IsUUID(undefined, { message: 'ID格式错误' })
    @IsDefined({ message: 'ID必须指定' })
    post: string;

    /**
     * 上级评论ID
     */
    @IsUUID(undefined, { always: true, message: 'ID格式错误' })
    @ValidateIf((value) => value.parent !== null && value.parent)
    @IsOptional({ always: true })
    @Transform(({ value }) => (value === 'null' ? null : value))
    parent?: string;
}
