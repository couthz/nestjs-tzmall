
import { ProdAttrvalue } from './../entities/prod-attrvalue.entity';
import { ProdCategoryRepository } from './../repositories/prod-category.repository';
import { ProdAttrvalueRepository } from '../repositories/prod-attrvalue.repository';
import { Injectable } from '@nestjs/common';
import { ProdRepository } from '../repositories/prod.repository';
import { BaseService } from '@/modules/database/base';
import { Prod, ProdCateAttr } from '../entities';
import { ProdDetailDTO } from '../dtos/prod-detail.dto';
import { ProdSkuSelectDTO } from '../dtos/prod-sku-select.dto';
import { SkuRepository } from '../repositories/sku.repository';
import { Sku } from '../entities/sku.entity';
import { GetCategoryProdDTO } from '../dtos/get-category-prod.dto';
import { PaginateReturn } from '@/modules/database/types';
import { SelectQueryBuilder } from 'typeorm';
import { ProdStatus } from '../enums/prod.enum';
import { RequestBodyAPIDTO } from '@/modules/restful/dtos/request-body-api.dto';
import { GetProdPageDTO } from '../dtos/get-prod-page.dto';
import { ProdDetailWithAttrDTO } from '../dtos/prod-detail-with-attr.dto';
import { ProdCateAttrRepository } from '../repositories/prod-cate-attr.repository';
import { UpdateProdStatusDTO } from '../dtos/update-prod-status.dto';
import { UpdateProdDTO } from '../dtos/update-product/update-product.dto';
import { CommonStatus, DeleteStatus } from '@/modules/core/constants/enums';

@Injectable()
export class ProdService extends BaseService<Prod, ProdRepository> {
    constructor(
        protected prodRepository: ProdRepository,
        protected prodAttrvalueRepository: ProdAttrvalueRepository,
        protected prodCateAttrRepository: ProdCateAttrRepository,
        protected skuRepository: SkuRepository,
        protected prodCategoryRepository: ProdCategoryRepository,
    ) {
        super(prodRepository);
    }

    async updateProduct(updateProdDTO: UpdateProdDTO) {
        const newProd = await this.prodRepository.create(updateProdDTO);
        this.prodRepository.save(newProd);
        

         const attrListData = updateProdDTO.attrListData;
         const skuList = updateProdDTO.skuList;
         if (attrListData.length === 0 || skuList.length === 0) {
            return;
         }

         this.prodAttrvalueRepository.removeByProdId(updateProdDTO.prodId);
         this.skuRepository.removeByProdId(updateProdDTO.prodId);

         //用于插入sku时完成关联
         const attrValueNameIdMapList:Map<string, string>[] = [];
         const attrValueIdImageMap = new Map<string, string>;
        //更新属性值数据,当
         for (let i = 0; i < attrListData.length; i++) {
            const attrValueNameIdMap = new Map<string, string>();
            const attrListEntry = attrListData[i];
            for (let j = 0; j < attrListEntry.attrValueFieldList.length; j++) {
                const attrValueField = attrListEntry.attrValueFieldList[j];
                const newAttrValue = await this.prodAttrvalueRepository.create(
                    {
                        attrId: attrListEntry.attrId, 
                        attrName: attrListEntry.attrName,
                        attrValueName: attrValueField.attrValue,
                        prodId: updateProdDTO.prodId,
                        status: CommonStatus.ACTIVE,
                        pic: attrValueField.imgUrl,
                    });
                await this.prodAttrvalueRepository.save(newAttrValue);
                attrValueNameIdMap.set(attrValueField.attrValue, newAttrValue.attrValueId);
                if (attrValueField.imgUrl != null) {
                    attrValueIdImageMap.set(newAttrValue.attrValueId, attrValueField.imgUrl);
                }
            }
            attrValueNameIdMapList.push(attrValueNameIdMap);
         }

         for(let i = 0; i < skuList.length; i++) {
            const skuEntry = skuList[i];
            const joinAttrValueName = skuEntry.joinAttrValueName.split('|');
            const skuName = joinAttrValueName.join(" ");
            const attrList = [];
            let imgUrl: string;
            for(let j = 0; j < joinAttrValueName.length; j++) {
                const attrValueName = joinAttrValueName[j];
                const attrValueId = attrValueNameIdMapList[j].get(attrValueName);
                attrList.push(attrValueId);

                if (j === 0) {
                    imgUrl = attrValueIdImageMap.get(attrValueId);
                }
            }
            const attrListJson = JSON.stringify(attrList);
            const newSku = await this.skuRepository.create(
                {
                    prodId: updateProdDTO.prodId, 
                    categoryId: updateProdDTO.categoryId,
                    oriPrice: skuEntry.price, 
                    price: skuEntry.price,
                    stocks: parseInt(skuEntry.stock),
                    actualStocks: parseInt(skuEntry.stock),
                    pic: imgUrl,
                    skuName: skuName,
                    prodName: `${updateProdDTO.prodName} ${skuName}`,
                    status: CommonStatus.ACTIVE,
                    isDelete: DeleteStatus.UnDeleted,
                    attr: attrListJson
                });
            await this.skuRepository.save(newSku);
         }


    }

    async getProdPageByStatus(
        requestParams: RequestBodyAPIDTO<GetProdPageDTO>,
    ): Promise<PaginateReturn<Prod>> {
        const { status } = requestParams.params;

        const addQuery = async (qb: SelectQueryBuilder<Prod>) => {
            qb.where('prod.status = :status', { status });
            return qb;
        };

        return await super.paginate(requestParams.page, addQuery);
    }

    async getProdPageByCategoryId(
        requestParams: GetCategoryProdDTO,
    ): Promise<PaginateReturn<Prod>> {
        const { categoryId } = requestParams;

        const addQuery = async (qb: SelectQueryBuilder<Prod>) => {
            qb.where('prod.category_id = :categoryId', { categoryId });
            qb.andWhere('prod.status = :status', { status: ProdStatus.ONLINE });
            qb.andWhere('prod.total_stocks > 0');
            return qb;
        };

        const prodPage = await super.paginate(requestParams, addQuery);

        return prodPage;
    }

    async getProdDetailDTOById(prodId: string): Promise<ProdDetailDTO> {
        const prodDetailDTO = new ProdDetailDTO();
        const prod = await this.prodRepository.getProdInfoById(prodId);
        Object.assign(prodDetailDTO, prod);

        prodDetailDTO.prodSkuSelectDTO = await this.buildProdSkuSelect(prod.categoryId,prodId);

        return prodDetailDTO;
    }

    async getProdDetailWithAttrDTOById(categoryId: string, prodId: string): Promise<ProdDetailWithAttrDTO> {
        const prodDetailWithAttrDTO = new ProdDetailWithAttrDTO();
        const prod = await this.prodRepository.getProdInfoById(prodId);
        Object.assign(prodDetailWithAttrDTO, prod);

        //与小程序端不同的时,对于某种类别而言(如服装),属性名是已经固定的,而属性值在没添加任何商品前可能为空
        //这种情况下,小程序端的结果就是没有任何商品
        //而admin端有新增商品的需求,至少需要先根据类别得到对应属性名的list
        const prodCateAttrList = await this.getProdCateAttrList(categoryId);
        prodDetailWithAttrDTO.prodCateAttrList = prodCateAttrList;
        prodDetailWithAttrDTO.attrMap = await this.getAttrIdValueMap(prodCateAttrList, prodId);
        prodDetailWithAttrDTO.attrSkuMap = await this.getAttrSkuMap(prodId);

        prodDetailWithAttrDTO.categoryList = await this.prodCategoryRepository.listCategoryDesc();
        return prodDetailWithAttrDTO;
    }

    async buildProdSkuSelect(categoryId: string, prodId: string): Promise<ProdSkuSelectDTO> {
        const attrvalueMap = await this.buildAttrNameValueMap(categoryId, prodId);

        const skus = await this.skuRepository.getSkusByProdId(prodId);

        const attrSkuMap = await this.buildAttrSkuMap(attrvalueMap, skus);

        const prodSkuSelectDTO = new ProdSkuSelectDTO();
        prodSkuSelectDTO.attrvalueMap = attrvalueMap;
        prodSkuSelectDTO.attrSkuMap = attrSkuMap;
        return prodSkuSelectDTO;
    }

    async updateStatus(updateProdStatusDTO: UpdateProdStatusDTO) {
        return await this.prodRepository.updateStatus(updateProdStatusDTO.prodId, updateProdStatusDTO.status);
    }

    private async getProdCateAttrList(categoryId: string) {
        //key表示属性名的Id,value表示对应所有的属性值
        //map对应点击加购时弹出的sku选择界面
        const prodCateAttrList = await this.prodCateAttrRepository.getProdCateAttrList(categoryId);
        return prodCateAttrList;
    }

    private async getAttrIdValueMap(prodCateAttrList: ProdCateAttr[], prodId: string) {
        //key表示属性名的Id,value表示对应所有的属性值
        const attrMap = new Map<string, [ProdAttrvalue]>();
        await this.prodAttrvalueRepository
            .getAttrvalueByAttrAndProdId(prodCateAttrList, prodId)
            .then((attrvalues) => {
                attrvalues.forEach((attrvalue) => {
                    if (attrMap.has(attrvalue.attrId)) {
                        attrMap.get(attrvalue.attrId).push(attrvalue);
                    } else {
                        attrMap.set(attrvalue.attrId, [attrvalue]);
                    }
                });
            });
        return attrMap;
    }

    private async buildAttrNameValueMap(categoryId:string, prodId: string) {
        //key表示属性名,value表示对应所有的属性值
        //map对应点击加购时弹出的sku选择界面
        const prodCateAttrList = await this.prodCateAttrRepository.getProdCateAttrList(categoryId);
        const attrvalueMap = new Map<string, [ProdAttrvalue]>();
        await this.prodAttrvalueRepository
            .getAttrvalueByAttrAndProdId(prodCateAttrList, prodId)
            .then((attrvalues) => {
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
        const skuAttrArr: [string][] = [];
        skus.forEach((sku) => {
            const skuAttr: [string] = JSON.parse(sku.attr);
            skuAttrArr.push(skuAttr);
            tempSkuMap.set(skuAttr, sku);
        });

        const checkPathIsValid = (path: string[], curSkuAttrArr: [string][]) => {
            //遍历curSkuAttrArr的每一个数组,检查数组中包含了path中的所有元素,将所有符合条件的数组组成新数组
            const newSkuAttrArr: [string][] = [];

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
        };

        //定义一个递归函数,用于遍历所有的属性值组合,检查该组合能否最终组成一个sku
        //如果能组成sku,则将该组合加入attrSkuMap的key中
        //如果该组合是完整的属性值组合,则将对应的sku加入attrSkuMap的value中,否则value为null
        const checkAttrvalue = (index: number, path: string[], curSkuAttrArr: [string][]) => {
            if (index === attrvalueArr.length) {
                if (curSkuAttrArr.length != 0 && path.length === attrvalueArr.length) {
                    const sku = tempSkuMap.get(curSkuAttrArr[0]);
                    if (sku.stocks > 0) {
                        attrSkuMap.set(path.join('|'), sku);
                    }
                }
                return;
            }

            //这层循环是为了遍历当前属性名下的所有属性值
            for (let i = 0; i < attrvalueArr[index].length; i++) {
                const attrvalue = attrvalueArr[index][i];
                path.push(attrvalue.attrValueId);

                const newSkuAttrArr = checkPathIsValid(path, curSkuAttrArr);
                if (newSkuAttrArr.length > 0) {
                    if (path.length < attrvalueArr.length) {
                        attrSkuMap.set(path.join('|'), null);
                    }
                    checkAttrvalue(index + 1, path, newSkuAttrArr);
                }
                path.pop();
            }
        };
        for (let i = 0; i < attrvalueArr.length; i++) {
            checkAttrvalue(i, [], skuAttrArr);
        }
        return attrSkuMap;
    }

    private async getAttrSkuMap(prodId: string): Promise<Map<string, Sku>> {
        const skus = await this.skuRepository.getSkusByProdId(prodId);
        const attrSkuMap = new Map<string, Sku>();
        skus.forEach((sku) => {
            const skuAttrList: [string] = JSON.parse(sku.attr);
            attrSkuMap.set(skuAttrList.join('|'), sku);
        });
        return attrSkuMap;
    }
}
