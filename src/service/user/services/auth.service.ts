import { WxAuthenticationDTO } from './../dtos/wx-authentication.dto';
import { Inject, Injectable, Logger } from "@nestjs/common";
import { UserRepository } from "../repositories/user.repository";
import { HttpService } from '@nestjs/axios';
import { WxSessionDTO } from '../dtos/wx-session.dto';
import { catchError, lastValueFrom } from 'rxjs';
import { ApiException } from '@/common/core/exceptions/api.exception';
import { TokenInfoDTO } from '../dtos/token-info.dto';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class AuthService{
    constructor(
        protected userRepository: UserRepository,
        private readonly httpService: HttpService,
        private jwtService: JwtService,
        @Inject('userLogger') private readonly logger: Logger) {} 

    async wxLogin(wxAuthenticationDTO: WxAuthenticationDTO):Promise<TokenInfoDTO> {
        const code = wxAuthenticationDTO.code;
        const appId = process.env.MINIPROGRAM_APP_ID;
        const secret = process.env.MINIPROGRAM_SECRET;

        const wxSessionDTO = await this.code2Session(appId,secret,code);
        if (wxSessionDTO.openid == null) {
            this.logger.error("获取openid出现错误")
            throw new ApiException("获取openid出现错误，请稍后重试");
        }
        const openId = wxSessionDTO.openid;
        //TODO 暂时只有openid，后续需要获取unionId
        const user = await this.userRepository.getOrCreateUserByOpenId(openId);
        //根据user生成token 返回给前端
        const payload = { sub: user.userId, openId: user.openId };

        let tokenInfo = new TokenInfoDTO();
        tokenInfo.accessToken = await this.jwtService.sign(payload);
        tokenInfo.expiresIn = Number(process.env.JWT_EXPIRES_IN) ;

        return tokenInfo;
    }

    async code2Session(appId: string, secret: string, code: string): Promise<WxSessionDTO> {
        const apiUrl = 'https://api.weixin.qq.com/sns/jscode2session';
    
        // 使用 params 属性传递参数
        const params = {
          appid: appId,
          secret: secret,
          js_code: code,
          grant_type: "authorization_code"
        };

        const { data } = await lastValueFrom(this.httpService.get<WxSessionDTO>(apiUrl, { params: params }).pipe(
            catchError((err) => {
                this.logger.error(err);

                throw new ApiException(err.response.data.errmsg);
            }
        )));
        return data;
      }

}