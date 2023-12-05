import { ProdAttrvalueRepository } from './../repositories/prod-attrvalue.repository';
import { Injectable } from "@nestjs/common";
import { ProdRepository } from "../repositories/prod.repository";
import { BaseService } from "@/common/database/base";
import { Prod } from "../entities";
import { ProdDetailDTO } from "../dtos/prod-detail.dto";
import { ProdSkuSelectDTO } from "../dtos/prod-sku-select.dto";
import { SkuRepository } from '../repositories/sku.repository';
import { Sku } from '../entities/sku.entity';
import { ProdAttrvalue } from '../entities/prod-attrvalue.entity';
import { GetCategoryProdDTO } from '../dtos/get-categoty-prod.dto';
import { PaginateReturn } from '@/common/database/types';
import { SelectQueryBuilder } from 'typeorm';
import { ProdStatus } from '../enums/prod.enum';

@Injectable()
export class ProdService extends BaseService<Prod, ProdRepository> {
    constructor(protected prodRepository: ProdRepository, protected prodAttrvalueRepository: ProdAttrvalueRepository,protected skuRepository: SkuRepository) {
        super(prodRepository);
    }

    async getProdPageByCategoryId(getCategoryProdDTO: GetCategoryProdDTO): Promise<PaginateReturn<Prod>> {

        const { categoryId } = getCategoryProdDTO;

        const addQuery = async (qb: SelectQueryBuilder<Prod>) => {
          qb.where('prod.category_id = :categoryId', { categoryId })
          qb.andWhere('prod.status = :status', { status: ProdStatus.ONLINE});
          return qb; 
        };
        
        const prodPage =  await super.paginate(
            getCategoryProdDTO,
            addQuery,
        );

        return prodPage;
  }


    async getProdDetailDTOById(prodId: string): Promise<ProdDetailDTO> {
        const prodDetailDTO = new ProdDetailDTO();
        const prod = await this.prodRepository.getProdInfoById(prodId);
        Object.assign(prodDetailDTO, prod);

        prodDetailDTO.prodSkuSelectDTO = await this.buildProdSkuSelect(prodId);

        return prodDetailDTO;
    }

    async buildProdSkuSelect(prodId: string): Promise<ProdSkuSelectDTO> {
        const attrvalueMap = await this.buildAttrvalueMap(prodId);

        const skus = await this.skuRepository.getSkusByProdId(prodId)

        const attrSkuMap = await this.buildAttrSkuMap(attrvalueMap, skus);

        const prodSkuSelectDTO = new ProdSkuSelectDTO();
        prodSkuSelectDTO.attrvalueMap = attrvalueMap;
        prodSkuSelectDTO.attrSkuMap = attrSkuMap;
        return prodSkuSelectDTO;
    }

    private async buildAttrvalueMap(prodId: string) {
        //key表示属性名,value表示所有的属性值
        //map对应点击加购时弹出的sku选择界面
        const attrvalueMap = new Map<string, [ProdAttrvalue]>();
        await this.prodAttrvalueRepository.getAttrvalueByProdId(prodId).then((attrvalues) => { 
            attrvalues.forEach((attrvalue) => {
                if (attrvalueMap.has(attrvalue.attrName)) {
                    attrvalueMap.get(attrvalue.attrName).push(attrvalue);
                } else {
                    attrvalueMap.set(attrvalue.attrName, [attrvalue]);
                }
            });
        });
        return attrvalueMap;
    }   

    private async buildAttrSkuMap(attrvalueMap: Map<string, [ProdAttrvalue]>, skus: Sku[]) {
        //key表示sku选择器所有可能的路径，value表示sku,只有路径中包含了sku的所有属性，才能唯一确定一个sku
        //路径中只选择了部分属性,value为null,但表示可以组成sku
        //map中不包含某种路径,表示该路径不可选,前端按钮置灰
        const attrSkuMap = new Map<string, Sku>();
        //属性名-属性值map转为二维数组
        const attrvalueArr = Array.from(attrvalueMap.values());

        //将sku转为map,便于通过属性值组合查找sku
        const tempSkuMap = new Map<[string], Sku>();

        //每个sku属性值组合拼接成一个数组
        const skuAttrArr:[string][] = [];
        skus.forEach((sku) => {
            const skuAttr:[string] = JSON.parse(sku.attr);
            skuAttrArr.push(skuAttr);
            tempSkuMap.set(skuAttr, sku);
        });

        const checkPathIsValid = (path: string[], curSkuAttrArr:[string][]) => {
            //遍历curSkuAttrArr的每一个数组,检查数组中包含了path中的所有元素,将所有符合条件的数组组成新数组
            const newSkuAttrArr:[string][] = [];


            curSkuAttrArr.forEach((skuAttr) => {
                let flag = true;
                path.forEach((attrvalueId) => {
                    if (!skuAttr.includes(attrvalueId)) {
                        flag = false;
                        return;
                    }
                });
                if (flag) {
                    newSkuAttrArr.push(skuAttr);
                }
            });
            return newSkuAttrArr;

        }


        //定义一个递归函数,用于遍历所有的属性值组合,检查该组合能否最终组成一个sku
        //如果能组成sku,则将该组合加入attrSkuMap的key中
        //如果该组合是完整的属性值组合,则将对应的sku加入attrSkuMap的value中,否则value为null
        const checkAttrvalue = (index: number, path: string[], curSkuAttrArr:[string][]) => {
            if (index === attrvalueArr.length) {
                if (curSkuAttrArr.length != 0 && path.length === attrvalueArr.length) {
                    const sku = tempSkuMap.get(curSkuAttrArr[0])
                    if (sku.actualStocks > 0) {
                        attrSkuMap.set(path.join("|"), sku);

                    }
                }
                return;
            }
            
            //这层循环是为了遍历当前属性名下的所有属性值
            for (let i = 0; i < attrvalueArr[index].length; i++) {
                const attrvalue = attrvalueArr[index][i];
                path.push(attrvalue.attrValueId);

                const newSkuAttrArr = checkPathIsValid(path, curSkuAttrArr)
                if (newSkuAttrArr.length > 0) {
                    if (path.length < attrvalueArr.length) {
                        attrSkuMap.set(path.join("|"), null);
                    }
                    checkAttrvalue(index + 1, path, newSkuAttrArr);
                }
                path.pop();
            }
            
        }
        for (let i = 0; i < attrvalueArr.length; i++) {
            checkAttrvalue(i, [] , skuAttrArr);
        }
        return attrSkuMap;

    }
}


