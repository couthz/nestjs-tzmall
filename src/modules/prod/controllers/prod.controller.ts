import { Body, Controller, Get, Param, Post } from '@nestjs/common';

import { ApiTags } from '@nestjs/swagger';


import { ProdDetailDTO } from '@/modules/prod/dtos/prod-detail.dto';
import { ProdModule } from '../prod.module';
import { GetCategoryProdDTO } from '@/modules/prod/dtos/get-category-prod.dto';
import { Prod } from '@/modules/prod/entities';
import { ProdSkuSelectDTO } from '@/modules/prod/dtos/prod-sku-select.dto';
import { ProdService } from '../services';
import { Depends } from '@/modules/restful/decorators';
import { PaginateReturn } from '@/modules/database/types';

@ApiTags('商品管理')
@Depends(ProdModule)
@Controller('prod')
export class ProdController {
    constructor(protected service: ProdService) {}

    /**
     * 查询商品详情
     */
    @Get('prodDetail/:id')
    async getProdDetailDTOById(@Param('id')id: string): Promise<ProdDetailDTO> {
        
        return this.service.getProdDetailDTOById(id);
    }

    /**
     * 查询某分类下的商品列表
     * TODO 目前还是单层分类,之后改为多级分类树
     */
    @Post('categoryProdPage')
    async getProdPageByCategoryId(@Body() requestParams: GetCategoryProdDTO): Promise<PaginateReturn<Prod>> {

        const page = await this.service.getProdPageByCategoryId(requestParams);
         return page;
    }

    /**
     * 查询某分类下的商品列表
     * TODO 目前还是单层分类,之后改为多级分类树
     */
    @Get('skuSelect/:categoryId/:prodId')
    async getSkuSelect(@Param('categoryId') categoryId: string,@Param('prodId') prodId: string): Promise<ProdSkuSelectDTO> {

        const map = await this.service.buildProdSkuSelect(categoryId, prodId);
        return map;
    }
}
