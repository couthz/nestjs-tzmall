import { Body, Controller, Get, Param, Post } from '@nestjs/common';

import { ApiTags } from '@nestjs/swagger';

import { Depends } from '@/common/restful/decorators';

import { ProdService } from '../../../../service/prod/services';
import { ProdDetailDTO } from '@/service/prod/dtos/prod-detail.dto';
import { ProdModule } from '../prod.module';
import { GetCategoryProdDTO } from '@/service/prod/dtos/get-categoty-prod.dto';
import { Prod } from '@/service/prod/entities';
import { PaginateReturn } from '@/common/database/types';
import { ProdSkuSelectDTO } from '@/service/prod/dtos/prod-sku-select.dto';

@ApiTags('商品操作')
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
    @Post('categotyProdPage')
    async getProdPageByCategoryId(@Body() getCategoryProdDTO: GetCategoryProdDTO): Promise<PaginateReturn<Prod>> {
        return await this.service.getProdPageByCategoryId(getCategoryProdDTO);
    }

    /**
     * 查询某分类下的商品列表
     * TODO 目前还是单层分类,之后改为多级分类树
     */
    @Get('skuSelect/:prodId')
    async getSkuSelect(@Param('prodId') prodId: string): Promise<ProdSkuSelectDTO> {

        const map = await this.service.buildProdSkuSelect(prodId);
        return map;
    }
}
