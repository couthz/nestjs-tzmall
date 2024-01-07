import { CallHandler, ExecutionContext, Injectable, NestInterceptor } from '@nestjs/common';
import { isNil } from 'lodash';
import { Observable } from 'rxjs';

@Injectable()
export class UserIdInterceptor implements NestInterceptor {
    intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
        const request: any = context.switchToHttp().getRequest();
        if (!isNil(request.user?.id)) {
            if (isNil(request.body)) request.body = { userId: request.user.id };
            else request.body.userId = request.user.id;
        }
        return next.handle();
    }
}
