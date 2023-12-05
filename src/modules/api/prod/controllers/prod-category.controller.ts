import { Controller, Get } from '@nestjs/common';

import { ApiTags } from '@nestjs/swagger';

import { Depends } from '@/common/restful/decorators';

import { ProdCategory } from '../../../../service/prod/entities';
import { ProdModule } from '../prod.module';
import { ProdCategoryService } from '@/service/prod/services/prod-category.service';

@ApiTags('商品分类操作')
@Depends(ProdModule)
@Controller('prodCategory')
export class ProdCategoryController {
    constructor(protected service: ProdCategoryService) {}

    /**
     * 查询所有分类及其商品
     */
    @Get('categoryProdList')
    async getCategoryProdList(): Promise<ProdCategory[]> {
         const listCategoryProd = await this.service.listCategoryProd();
         console.log(listCategoryProd);
         return listCategoryProd
    }

    /**
     * 查询所有分类
     * TODO 目前还是单层分类,之后改为多级分类树
     */
    @Get('category')
    async getAllCategory(): Promise<ProdCategory[]> {
        return this.service.listCategoryProd();
    }
}
