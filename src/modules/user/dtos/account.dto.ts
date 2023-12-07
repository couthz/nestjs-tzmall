import { PickType } from '@nestjs/swagger';

import { Length } from 'class-validator';

import { IsPassword } from '@/modules/core/constraints';
import { DtoValidation } from '@/modules/core/decorators';

import { UserValidateGroups } from '../constants';

import { UserCommonDto } from './common.dto';

/**
 * 更新用户信息
 */
@DtoValidation({ groups: [UserValidateGroups.UPDATE] })
export class UpdateAccountDto extends PickType(UserCommonDto, ['username', 'nickname']) {}

/**
 * 更改用户密码
 */
export class UpdatePasswordDto extends PickType(UserCommonDto, ['password', 'plainPassword']) {
    /**
     * 旧密码:用户在更改密码时需要输入的原密码
     */
    @IsPassword(5, {
        message: '密码必须由小写字母,大写字母,数字以及特殊字符组成',
        always: true,
    })
    @Length(8, 50, {
        message: '密码长度不得少于$constraint1',
        always: true,
    })
    oldPassword: string;
}
