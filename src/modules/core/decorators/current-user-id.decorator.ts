import { createParamDecorator } from "@nestjs/common";

export const CurrentUserId = createParamDecorator((data, ctx) => {
    const request = ctx.switchToHttp().getRequest();
    const user = request.user;
    return user.sub;
});