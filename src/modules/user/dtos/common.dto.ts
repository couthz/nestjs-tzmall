import { Injectable } from '@nestjs/common';
import { IsEmail, IsNotEmpty, IsOptional, Length } from 'class-validator';

import { IsMatch, IsMatchPhone, IsPassword } from '@/modules/core/constraints';
import { IsUnique, IsUniqueExist } from '@/modules/database/constraints';

import { UserValidateGroups } from '../constants';
import { UserEntity } from '../entities/user.entity';

/**
 * 用户模块DTO的通用基础字段
 */
@Injectable()
export class UserCommonDto {
    /**
     * 登录凭证:可以是用户名,手机号,邮箱地址
     */
    @Length(4, 30, {
        message: '登录凭证长度必须为$constraint1到$constraint2',
        always: true,
    })
    @IsNotEmpty({ message: '登录凭证不得为空', always: true })
    credential: string;

    /**
     * 用户名
     */
    @IsUnique(
        { entity: UserEntity },
        {
            groups: [UserValidateGroups.USER_CREATE, UserValidateGroups.AUTH_REGISTER],
            message: '该用户名已被注册',
        },
    )
    @IsUniqueExist(
        { entity: UserEntity, ignore: 'id' },
        {
            groups: [UserValidateGroups.USER_UPDATE],
            message: '该用户名已被注册',
        },
    )
    @IsUniqueExist(
        { entity: UserEntity, ignore: 'id', ignoreKey: 'userId' },
        {
            groups: [UserValidateGroups.ACCOUNT_UPDATE],
            message: '该用户名已被注册',
        },
    )
    @Length(4, 30, {
        always: true,
        message: '用户名长度必须为$constraint1到$constraint2',
    })
    @IsOptional({ groups: [UserValidateGroups.USER_UPDATE, UserValidateGroups.ACCOUNT_UPDATE] })
    username: string;

    /**
     * 昵称:不设置则为用户名
     */
    @Length(3, 20, {
        always: true,
        message: '昵称必须为$constraint1到$constraint2',
    })
    @IsOptional({ always: true })
    nickname?: string;

    /**
     * 手机号:必须是区域开头的,比如+86.15005255555
     */
    @IsUnique(
        { entity: UserEntity },
        {
            message: '手机号已被注册',
            groups: [
                UserValidateGroups.USER_CREATE,
                UserValidateGroups.USER_UPDATE,
                UserValidateGroups.AUTH_REGISTER,
            ],
        },
    )
    @IsMatchPhone(
        undefined,
        { strictMode: true },
        {
            message: '手机格式错误,示例: +86.15005255555',
            always: true,
        },
    )
    @IsOptional({
        groups: [
            UserValidateGroups.USER_CREATE,
            UserValidateGroups.USER_UPDATE,
            UserValidateGroups.AUTH_REGISTER,
        ],
    })
    phone: string;

    /**
     * 邮箱地址:必须符合邮箱地址规则
     */
    @IsUnique(
        { entity: UserEntity },
        {
            message: '邮箱已被注册',
            groups: [
                UserValidateGroups.USER_CREATE,
                UserValidateGroups.USER_UPDATE,
                UserValidateGroups.AUTH_REGISTER,
            ],
        },
    )
    @IsEmail(undefined, {
        message: '邮箱地址格式错误',
        always: true,
    })
    @IsOptional({
        groups: [
            UserValidateGroups.USER_CREATE,
            UserValidateGroups.USER_UPDATE,
            UserValidateGroups.AUTH_REGISTER,
        ],
    })
    email: string;

    /**
     * 用户密码:密码必须由小写字母,大写字母,数字以及特殊字符组成
     */
    @IsPassword(5, {
        message: '密码必须由小写字母,大写字母,数字以及特殊字符组成',
        always: true,
    })
    @Length(8, 50, {
        message: '密码长度不得少于$constraint1',
        always: true,
    })
    @IsMatch('oldPassword', true, {
        message: '新密码与旧密码不得相同',
        groups: [UserValidateGroups.ACCOUNT_CHANGE_PASSWORD],
    })
    @IsOptional({ groups: [UserValidateGroups.USER_UPDATE] })
    password: string;

    /**
     * 确认密码:必须与用户密码输入相同的字符串
     */
    @IsMatch('password', false, { message: '两次输入密码不同', always: true })
    @IsNotEmpty({ message: '请再次输入密码以确认', always: true })
    plainPassword: string;
}
