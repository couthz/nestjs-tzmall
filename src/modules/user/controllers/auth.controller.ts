import {
    Body,
    Controller,
    Patch,
    Post,
    Request,
    SerializeOptions,
    UseGuards,
} from '@nestjs/common';

import { ApiBearerAuth, ApiOperation, ApiTags } from '@nestjs/swagger';

import { Depends } from '@/modules/restful/decorators';

import { Guest, ReqUser } from '../decorators';
import { CredentialDto, RegisterDto, UpdatePasswordDto } from '../dtos';
import { UserEntity } from '../entities';
import { LocalAuthGuard } from '../guards';
import { AuthService } from '../services';
import { UserModule } from '../user.module';

@ApiTags('账户操作')
@Depends(UserModule)
@Controller('auth')
export class AuthController {
    constructor(protected authService: AuthService) {}

    /**
     * 用户通过凭证(可以是用户名,邮箱,手机号等)+密码登录
     * @param user
     */
    @Post('login')
    @Guest()
    @UseGuards(LocalAuthGuard)
    async login(@ReqUser() user: ClassToPlain<UserEntity>, @Body() _data: CredentialDto) {
        return { token: await this.authService.createToken(user.id) };
    }

    /**
     * 注销登录
     * @param req
     */
    @Post('logout')
    @ApiOperation({ summary: '用户登出账户' })
    @ApiBearerAuth()
    async logout(@Request() req: any) {
        return this.authService.logout(req);
    }

    /**
     * 使用用户名密码注册用户
     * @param data
     */
    @Post('register')
    @ApiOperation({ summary: '通过用户名+密码注册账户' })
    @Guest()
    async register(
        @Body()
        data: RegisterDto,
    ) {
        return this.authService.register(data);
    }

    /**
     * 用户密码更新
     * @param user
     * @param data
     */
    @Patch('reset-passowrd')
    @ApiOperation({ summary: '重置密码' })
    @ApiBearerAuth()
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
