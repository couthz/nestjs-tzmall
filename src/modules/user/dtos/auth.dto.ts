import { PickType } from '@nestjs/swagger';

import { DtoValidation } from '@/modules/core/decorators';

import { UserValidateGroups } from '../constants';

import { UserCommonDto } from './common.dto';

/**
 * 用户正常方式登录
 */
export class CredentialDto extends PickType(UserCommonDto, ['credential', 'password']) {}

/**
 * 普通方式注册用户
 */
@DtoValidation({ groups: [UserValidateGroups.AUTH_REGISTER] })
export class RegisterDto extends PickType(UserCommonDto, [
    'username',
    'nickname',
    'password',
    'plainPassword',
] as const) {}
