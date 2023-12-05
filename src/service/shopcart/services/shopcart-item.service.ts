import { Big } from 'big.js';
import { ChangeShopcartDTO } from '../dtos/change-shopcart.dto';

import { Injectable } from '@nestjs/common';
import { BaseService } from '@/common/database/base';
import { ShopcartItem } from '../entities';
import { ShopcartItemRepository } from '../repositories/shopcart-item.repository';
import { ApiException } from '@/common/core/exceptions/api.exception';
import { ProdRepository, SkuRepository } from '@/service/prod/repositories';
import { ShopcartAmountDTO } from '../dtos/shopcart-amount.dto';
import { ProdStatus } from '@/service/prod/enums/prod.enum';
import { CommonStatus } from '@/common/core/constants/enums';



@Injectable()
export class ShopcartItemService extends BaseService<ShopcartItem, ShopcartItemRepository>{
    constructor(protected repository: ShopcartItemRepository,protected prodRepository: ProdRepository,protected skuRepository: SkuRepository) {
        super(repository);
    }


    //通过prodId, skuId 添加或修改用户的购物车商品,当传入的商品数量count为正时,增加购物车商品数量,为负时,减少购物车商品数量，为0时,删除购物车商品
    //用户在商品详情页点击加入购物车时不存在shopCartItemId,需要比对skuId确认是否存在该商品
    //用户在购物车页面修改商品数量时,需要传入购物车项shopCartItemId  
    async addOrUpdateShopcartItem(changeShopcartDTO: ChangeShopcartDTO, userId: string): Promise<void> {

        if (changeShopcartDTO.itemCount === 0) {
            throw new ApiException('购物车商品数量不能为0');
        }

        const shopcartItems = await this.repository.getShopcartItemsByUserId(userId);
        const prod = await this.prodRepository.getProdInfoById(changeShopcartDTO.prodId);
        const sku = await this.skuRepository.getSkuById(changeShopcartDTO.skuId);

        if (prod.status !== ProdStatus.ONLINE || sku.status !== CommonStatus.ACTIVE) {
            throw new ApiException(`商品${sku.skuName}已下架`);
        }

        let shopcartItem: ShopcartItem;
        //存在shopcartItemId时,即从购物车页面直接修改商品数量的情况,需要在购物车中查找该商品    
        if (changeShopcartDTO.shopcartItemId != null) {
            shopcartItem = await this.repository.findOneBy({ shopcartItemId: changeShopcartDTO.shopcartItemId });
        }
        //不存在shopcartItemId时,即从商品详情页点击加入购物车的情况,需要在购物车中查找是否存在该商品
        if (changeShopcartDTO.shopcartItemId == null || shopcartItem == null) {
            console.log(shopcartItems);
            shopcartItems.forEach((item) => {
                if (item.skuId === changeShopcartDTO.skuId) {
                    shopcartItem = item;
                }
            });
        }
        //购物车存在商品    
        if (shopcartItem != null) {
            //防止购物车item数量变为负数
            if (shopcartItem.itemCount <= 0) {
                this.repository.deleteShopcartItemById(shopcartItem.shopcartItemId);
                return;
            }

            //当sku实际库存不足时,不能添加到购物车
            if (shopcartItem.itemCount > sku.actualStocks) {
                throw new ApiException(`商品${sku.skuName}库存不足`);
            }

            this.repository.updateShopcartItem(shopcartItem);
            return;
        }
        console.log("购物车不存在商品")
        //购物车不存在商品
        // 防止购物车不存在商品时,count仍为负数
        if (changeShopcartDTO.itemCount < 0) {
            throw new ApiException(`购物车不存在商品${sku.skuName}`);
        }

        //当sku实际库存不足时,不能添加到购物车
        if (changeShopcartDTO.itemCount > sku.actualStocks) {
            throw new ApiException(`商品${sku.skuName}库存不足`);
        }

        //添加商品到购物车
        this.insertShopcartItem(changeShopcartDTO, userId);
        return
    }

    //添加商品到购物车
    async insertShopcartItem(changeShopcartDTO: ChangeShopcartDTO, userId: string): Promise<void> {
        const shopcartItem = await this.repository.create({...changeShopcartDTO, userId})

        await this.repository.save(shopcartItem);
        return;
    }

    //通过用户ID获取用户购物车
    async getShopcartItemsAndProdsByUserId(userId: string): Promise<ShopcartItem[]> {
        return this.repository.getShopcartItemsAndProdsByUserId(userId);
    }

    //通过删除购物车项
    async deleteShopcartItemsByIds(shopcartItemIds: string[]): Promise<void> {
        return this.repository.deleteShopcartItemsByIds(shopcartItemIds);
    }

    async getShopcartTotalPay(shopcartItemIds: [string]): Promise<ShopcartAmountDTO> {

        let totalPay = Big("0");
        let totalItemsCount = 0;
        //使用this.repository.findBy找到shopcartItemIds包含的shopcartItemId对应的shopcartItem
        const shopcartItems = await this.repository.getShopcartItemsAndProdsByIds(shopcartItemIds);
        //将shopcartItems中的每一个shopcartItem的sku.price和itemCount相乘,并将结果相加
         shopcartItems.forEach((shopcartItem) => {
            totalPay = totalPay.plus(Big(shopcartItem.sku.price).times(shopcartItem.itemCount));
            totalItemsCount += shopcartItem.itemCount;
        });


        return { totalPay: totalPay.toFixed(2), totalItemsCount };
    }

}
