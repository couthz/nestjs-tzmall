import { Controller, Get } from '@nestjs/common';

import { ApiTags } from '@nestjs/swagger';

import { Depends } from '@/common/restful/decorators';

import { ProdTag } from '../../../../service/prod/entities';
import { ProdModule } from '../prod.module';
import { ProdTagService } from '../../../../service/prod/services';

@ApiTags('商品标签操作')
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
