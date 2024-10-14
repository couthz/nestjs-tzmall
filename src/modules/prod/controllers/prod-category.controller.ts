import { Controller, Get } from '@nestjs/common';

import { ApiTags } from '@nestjs/swagger';


import { ProdModule } from '../prod.module';
import { ProdCategoryService } from '@/modules/prod/services/prod-category.service';
import { ProdCategory } from '../entities';
import { Depends } from '@/modules/restful/decorators';

@ApiTags('商品分类管理')
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
         console.log(listCategoryProd[1]);
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
