import {
    CanActivate,
    ExecutionContext,
    Injectable,
  } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
  import { JwtService } from '@nestjs/jwt';
import { ApiException } from '../exceptions/api.exception';
import { IS_PUBLIC_KEY } from '../decorators/public.decorator';
@Injectable()
export class AuthGuard implements CanActivate {
  constructor(private jwtService: JwtService, private reflector: Reflector) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const isPublic = this.reflector.getAllAndOverride<boolean>(IS_PUBLIC_KEY, [
        context.getHandler(),
        context.getClass(),
      ]);
      if (isPublic) {
        // See this condition
        return true;
      }
    
    const request = context.switchToHttp().getRequest();
    const accessToken = request.headers['authorization'];
    if (!accessToken) {
      throw new ApiException("请先登录",11001);
    }
    try {
      const payload = await this.jwtService.verifyAsync(accessToken, {
        secret: process.env.JWT_SECRET,
      });
      // 💡 We're assigning the payload to the request object here
      // so that we can access it in our route handlers
      request['user'] = payload;

    } catch {
        throw new ApiException("请先登录",11001);
    }
    return true;
  }
}
