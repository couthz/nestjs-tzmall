import { ApiTags } from "@nestjs/swagger";
import { UserModule } from "../user.module";
import { Depends } from "@/modules/restful/decorators";
import { Body, Controller, Post } from "@nestjs/common";
import { Public } from "@/modules/core/decorators/public.decorator";
import { AuthService } from "../services";
import { WxAuthenticationDTO } from "../dtos/wx-authentication.dto";
import { TokenInfoDTO } from "../dtos/token-info.dto";
@ApiTags('用户认证管理')
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

