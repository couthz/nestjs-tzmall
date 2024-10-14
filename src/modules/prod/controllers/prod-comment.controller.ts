//模仿prod.controller.ts写prod-comment.controller.ts
import { Body, Controller, Post } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { ProdModule } from '../prod.module';
import { ProdCommentService } from '../services';

import { Depends } from '@/modules/restful/decorators';
import { ProdComment } from '../entities';
import { GetProdCommentPageDTO } from '../dtos/get-prod-comment-page.dto';
import { PaginateReturn } from '@/modules/database/types';

@ApiTags('商品评论管理')
@Depends(ProdModule)
@Controller('prodComment')
export class ProdCommentController {
    constructor(protected service: ProdCommentService) {}

    /**
    /**
     * 查询某商品下的评论
     */
    @Post('prodCommmentPage')
    async getProdCommentPage(@Body() requestParams: GetProdCommentPageDTO): Promise<PaginateReturn<ProdComment>> {
        console.log(requestParams);
        return this.service.getProdCommentPage(requestParams);
    }
}
