import { CallHandler, ExecutionContext, NestInterceptor } from '@nestjs/common';
import { Observable } from 'rxjs';
import { FastifyReply } from 'fastify';
import { map } from 'rxjs/operators';
import { ResponseDto } from '../class/res.class';

/**
 * 统一处理返回接口结果，如果不需要则添加@Keep装饰器
 */
export class ApiTransformInterceptor implements NestInterceptor {
  constructor() {}
  intercept(
    context: ExecutionContext,
    next: CallHandler<any>,
  ): Observable<any> {
    return next.handle().pipe(
      map((data) => {
          const response = context.switchToHttp().getResponse<FastifyReply>();
          response.header('Content-Type', 'application/json; charset=utf-8');
          return new ResponseDto(200, data);
        
      }),
    );
  }
}
