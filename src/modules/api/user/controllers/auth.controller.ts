import { ApiTags } from "@nestjs/swagger";
import { UserModule } from "../user.module";
import { Depends } from "@/common/restful/decorators";
import { Body, Controller, Post } from "@nestjs/common";
import { AuthService } from "@/service/user/services";
import { WxAuthenticationDTO } from "@/service/user/dtos/wx-authentication.dto";
import { TokenInfoDTO } from '@/service/user/dtos/token-info.dto';
import { Public } from "@/common/core/decorators/public.decorator";
@ApiTags('用户认证操作')
@Depends(UserModule)
@Controller('auth')
export class AuthController {

    constructor(protected service: AuthService) {}

    @Post('wxLogin')
    @Public()
    async submit(@Body() wxAuthenticationDTO:WxAuthenticationDTO): Promise<TokenInfoDTO> {
        return await this.service.wxLogin(wxAuthenticationDTO);
    }

}

