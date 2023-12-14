import { Body, Controller, Get, Patch, SerializeOptions } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { pick } from 'lodash';

import { Depends } from '@/modules/restful/decorators';

import { ReqUser } from '../decorators';
import { UpdateAccountDto, UpdatePasswordDto } from '../dtos';
import { UserEntity } from '../entities';
import { AuthService, UserService } from '../services';
import { UserModule } from '../user.module';

@ApiTags('账户操作')
@ApiBearerAuth()
@Depends(UserModule)
@Controller('account')
export class AccountController {
    constructor(
        protected authService: AuthService,
        protected userService: UserService,
    ) {}

    /**
     * 获取用户个人信息
     * 查询账户信息(只有用户自己才能查询)
     * @param user
     */
    @Get('profile')
    @SerializeOptions({
        groups: ['user-detail'],
    })
    async profile(@ReqUser() user: ClassToPlain<UserEntity>) {
        return this.userService.detail(user.id);
    }

    /**
     * 更改账户信息
     * @param user
     * @param data
     */
    @Patch()
    @SerializeOptions({
        groups: ['user-detail'],
    })
    async update(
        @ReqUser() user: ClassToPlain<UserEntity>,
        @Body()
        data: UpdateAccountDto,
    ) {
        return this.userService.update({ id: user.id, ...pick(data, ['username', 'nickname']) });
    }

    /**
     * 更改密码
     * @param user
     * @param data
     */
    @Patch('reset-passowrd')
    @SerializeOptions({
        groups: ['user-detail'],
    })
    async resetPassword(
        @ReqUser() user: ClassToPlain<UserEntity>,
        @Body() data: UpdatePasswordDto,
    ): Promise<UserEntity> {
        return this.authService.updatePassword(user, data);
    }
}
