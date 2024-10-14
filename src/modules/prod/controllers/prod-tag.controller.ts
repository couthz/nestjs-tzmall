import { Controller, Get } from '@nestjs/common';

import { ApiTags } from '@nestjs/swagger';


import { ProdModule } from '../prod.module';
import { ProdTag } from '../entities';
import { ProdTagService } from '../services';
import { Depends } from '@/modules/restful/decorators';

@ApiTags('商品标签管理')
@Depends(ProdModule)
@Controller('prodTag')
export class ProdTagController {
    constructor(protected service: ProdTagService) {}

    /**
     * 查询某个标签下的所有商品
     */
    @Get('tagProdList')
    async getTagProdList(): Promise<Partial<ProdTag>[]> {
        return this.service.listTagProd();
    }
}
