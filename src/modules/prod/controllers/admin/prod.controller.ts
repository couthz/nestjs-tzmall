import { Body, Controller, Post, Get, Param } from '@nestjs/common';

import { ApiTags } from '@nestjs/swagger';


import { ProdModule } from '../../prod.module';
import { Prod } from '@/modules/prod/entities';
import { ProdService } from '../../services';
import { Depends } from '@/modules/restful/decorators';
import { PaginateReturn } from '@/modules/database/types';
import { RequestBodyAPIDTO } from '@/modules/restful/dtos/request-body-api.dto';
import { GetProdPageDTO } from '../../dtos/get-prod-page.dto';
import { ProdDetailWithAttrDTO } from '../../dtos/prod-detail-with-attr.dto';
import { UpdateProdStatusDTO } from '../../dtos/update-prod-status.dto';
import { UpdateProdDTO } from '../../dtos/update-product/update-product.dto';

@ApiTags('商品管理')
@Depends(ProdModule)
@Controller('prod')
export class ProdController {
    constructor(protected service: ProdService) {}


    /**
     * 分页查询所有商品
     */
    @Post('page')
    async getProdPageByCategoryId(@Body() requestParams: RequestBodyAPIDTO<GetProdPageDTO>): Promise<PaginateReturn<Prod>> {
        return await this.service.getProdPageByStatus(requestParams);
    }

    /**
     * 查询商品详情
     */
    @Get('prodDetail/:categoryId/:prodId')
    async getProdDetailWithAttrDTOById(@Param('categoryId') categoryId: string, @Param('prodId') prodId: string): Promise<ProdDetailWithAttrDTO> {
        return this.service.getProdDetailWithAttrDTOById(categoryId, prodId);
         
    }

    /**
     * 更新商品状态
     */
    @Post('updateStatus')
    async updateStatus(@Body() updateProdStatusDTO: UpdateProdStatusDTO) {
        return this.service.updateStatus(updateProdStatusDTO);
    }

    /**
     * 更新商品状态
     */
    @Post('updateProduct')
    async updateProduct(@Body() updateProdDTO: UpdateProdDTO) {
        await this.service.updateProduct(updateProdDTO);
    }
}
