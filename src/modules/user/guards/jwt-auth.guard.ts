import { ExecutionContext, Injectable, UnauthorizedException } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { AuthGuard } from '@nestjs/passport';
import { isNil } from 'lodash';
import { ExtractJwt } from 'passport-jwt';

import { ALLOW_GUEST } from '../constants';
import { TokenService } from '../services';

/**
 * 用户JWT认证守卫
 * 检测用户是否已登录
 */
@Injectable()
export class JwtAuthGuard extends AuthGuard('jwt') {
    constructor(
        protected reflector: Reflector,
        protected tokenService: TokenService,
    ) {
        super();
    }

    /**
     * 守卫方法
     * @param context
     */
    async canActivate(context: ExecutionContext) {
        const allowGuest = this.reflector.getAllAndOverride<boolean>(ALLOW_GUEST, [
            context.getHandler(),
            context.getClass(),
        ]);
        if (allowGuest) return true;
        const request = this.getRequest(context);
        const response = this.getResponse(context);
        // if (!request.headers.authorization) return false;
        // 从请求头中获取token
        // 如果请求头不含有authorization字段则认证失败
        const requestToken = ExtractJwt.fromAuthHeaderAsBearerToken()(request);
        if (isNil(requestToken)) throw new UnauthorizedException();
        // 判断token是否存在,如果不存在则认证失败
        const accessToken = isNil(requestToken)
            ? undefined
            : await this.tokenService.checkAccessToken(requestToken!);
        if (isNil(accessToken)) throw new UnauthorizedException();
        try {
            // 检测token是否为损坏或过期的无效状态,如果无效则尝试刷新token
            return (await super.canActivate(context)) as boolean;
        } catch (e) {
            // 尝试通过refreshToken刷新token
            // 刷新成功则给请求头更换新的token
            // 并给响应头添加新的token和refreshtoken
            const token = await this.tokenService.refreshToken(accessToken, response);
            if (isNil(token)) throw new UnauthorizedException();
            if (token.accessToken) {
                request.headers.authorization = `Bearer ${token.accessToken.value}`;
            }
            // 刷新失败则再次抛出认证失败的异常
            return (await super.canActivate(context)) as boolean;
        }
    }

    /**
     * 自动请求处理
     * 如果请求中有错误则抛出错误
     * 如果请求中没有用户信息则抛出401异常
     * @param err
     * @param user
     * @param _info
     */
    handleRequest(err: any, user: any, _info: Error) {
        if (err || isNil(user)) {
            if (isNil(user)) throw new UnauthorizedException();
            throw err;
        }
        return user;
    }

    getRequest(context: ExecutionContext) {
        return context.switchToHttp().getRequest();
    }

    getResponse(context: ExecutionContext) {
        return context.switchToHttp().getResponse();
    }
}
