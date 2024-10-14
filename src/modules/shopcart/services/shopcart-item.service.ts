import { Big } from 'big.js';
import { ChangeShopcartDTO } from '../dtos/change-shopcart.dto';

import { Injectable } from '@nestjs/common';
import { BaseService } from '@/modules/database/base';
import { ShopcartItem } from '../entities';
import { ShopcartItemRepository } from '../repositories/shopcart-item.repository';
import { ApiException } from '@/modules/core/exceptions/api.exception';
import { ProdRepository, SkuRepository } from '@/modules/prod/repositories';
import { ProdStatus } from '@/modules/prod/enums/prod.enum';
import { CommonStatus } from '@/modules/core/constants/enums';
import { GetShopcartDTO } from '../dtos/get-shopcart.dto';
import { ChangeItemCheckedDTO } from '../dtos/change-item-checked.dto';

@Injectable()
export class ShopcartItemService extends BaseService<ShopcartItem, ShopcartItemRepository> {
    constructor(
        protected repository: ShopcartItemRepository,
        protected prodRepository: ProdRepository,
        protected skuRepository: SkuRepository,
    ) {
        super(repository);
    }

    //更新某一个购物车项中的sku
    //这时的shopCartItemId代表的是原购物车项的id,skuid代表选择后新的skuId
    //直接更新这一项中的某些数据,而不是删除后重建,保证购物车中商品的顺序不变
    //数量不一定为1
    async updateSku(changeShopcartDTO: ChangeShopcartDTO, userId: string): Promise<string> {
        //1. 如果skuId已经在购物车中存在,则需要合并数量,并且删除shopCartItemId项
        let shopcartItem: ShopcartItem = null;
        shopcartItem = await this.repository.getShopcartItemsBySkuId(changeShopcartDTO.skuId);
        //注意如果是shopcartItem.shopcartItemId与changeShopcartDTO.shopcartItemId相等,则不需要任何修改
        if (
            shopcartItem != null &&
            shopcartItem.shopcartItemId != changeShopcartDTO.shopcartItemId
        ) {
            shopcartItem.itemCount += changeShopcartDTO.itemCount;
            await this.repository.updateShopcartItem(shopcartItem);
            await this.repository.deleteShopcartItemById(changeShopcartDTO.shopcartItemId);
        } else if (shopcartItem == null) {
            //2. 如果skuId不存在,则直接更新shopCartItemId的对应项
            shopcartItem = await this.repository.findOneBy({
                shopcartItemId: changeShopcartDTO.shopcartItemId,
            });
            shopcartItem.skuId = changeShopcartDTO.skuId;
            shopcartItem.prodId = changeShopcartDTO.prodId;
            await this.repository.updateShopcartItem(shopcartItem);
        }
        //计算新的总价
        const { totalPay } = await this.getShopcartItemsAndTotalPayByUserId(userId);
        return totalPay;
    }

    //通过prodId, skuId 添加或修改用户的购物车商品,当传入的商品数量count为正时,增加购物车商品数量,为负时,减少购物车商品数量
    //用户在商品详情页点击加入购物车时不存在shopCartItemId,需要比对skuId确认是否存在该商品
    //用户在购物车页面修改商品数量时,需要传入购物车项shopCartItemId
    async addOrUpdateShopcartItem(
        changeShopcartDTO: ChangeShopcartDTO,
        userId: string,
    ): Promise<string> {
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
            shopcartItem = await this.repository.findOneBy({
                shopcartItemId: changeShopcartDTO.shopcartItemId,
            });
        }
        //不存在shopcartItemId时,即从商品详情页点击加入购物车的情况,需要在购物车中查找是否存在该商品
        if (changeShopcartDTO.shopcartItemId == null || shopcartItem == null) {
            shopcartItems.forEach((item) => {
                if (item.skuId === changeShopcartDTO.skuId) {
                    shopcartItem = item;
                }
            });
        }
        //购物车存在商品,检查数量变更后是否为0,或者超出库存
        if (shopcartItem != null) {
            //商品数量变更
            shopcartItem.itemCount += changeShopcartDTO.itemCount;
            //购物车项的商品数减少到0时,删除购物车项
            if (shopcartItem.itemCount <= 0) {
                await this.repository.deleteShopcartItemById(shopcartItem.shopcartItemId);
            }

            //当sku实际库存不足时,不能添加到购物车
            else if (shopcartItem.itemCount > sku.stocks) {
                throw new ApiException(`商品：${sku.prodName}库存不足`);
            } else {
                await this.repository.updateShopcartItem(shopcartItem);
            }
        } else {
            //购物车不存在商品
            // 防止购物车不存在商品时,count仍为负数
            if (changeShopcartDTO.itemCount < 0) {
                throw new ApiException(`购物车不存在商品${sku.skuName},不能减少数量`);
            }

            //当sku实际库存不足时,不能添加到购物车
            if (changeShopcartDTO.itemCount > sku.stocks) {
                throw new ApiException(`商品${sku.skuName}库存不足`);
            }

            //添加商品到购物车
            await this.insertShopcartItem(changeShopcartDTO, userId);
        }
        //计算新的总价
        const { totalPay } = await this.getShopcartItemsAndTotalPayByUserId(userId);
        return totalPay;
    }

    //添加商品到购物车
    async insertShopcartItem(changeShopcartDTO: ChangeShopcartDTO, userId: string): Promise<void> {
        const shopcartItem = await this.repository.create({ ...changeShopcartDTO, userId, isChecked: false, isValid: true});

        await this.repository.save(shopcartItem);
        return;
    }

    async changeItemChecked(changeItemCheckedDTO: ChangeItemCheckedDTO, userId: string): Promise<string> {
        await this.repository.changeItemChecked(changeItemCheckedDTO);
        //计算新的总价
        const { totalPay } = await this.getShopcartItemsAndTotalPayByUserId(userId);
        return totalPay;

    }

    //通过用户ID获取用户购物车相关数据
    async getShopcartItemsAndTotalPayByUserId(userId: string): Promise<GetShopcartDTO> {
        const shopcartItems = await this.repository.getShopcartItemsAndProdsByUserId(userId);
        const totalPay = await this.getShopcartTotalPayByCheckedItems(shopcartItems);

        return { shopcartItems, totalPay };
    }


    //通过ids删除购物车项
    async deleteShopcartItemsByIds(shopcartItemIds: string[], userId:string): Promise<string> {
        await this.repository.deleteShopcartItemsByIds(shopcartItemIds);
        //计算新的总价
        const { totalPay } = await this.getShopcartItemsAndTotalPayByUserId(userId);
        return totalPay;
    }

    async getCheckedShopcartItemsByUserId(userId: string): Promise<ShopcartItem[]> {
    
        return this.repository.getCheckedShopcartItemsByUserId(userId);}

    async getShopcartTotalPayByCheckedItems(shopcartItems: ShopcartItem[]): Promise<string> {
        let totalPay = Big('0');
        shopcartItems.forEach((shopcartItem) => {
            if (shopcartItem.isChecked && shopcartItem.isValid) {
                totalPay = totalPay.plus(Big(shopcartItem.sku.price).times(shopcartItem.itemCount));
            }
        });
        return totalPay.toFixed(2);
    }

    async getShopcartProdCount(userId: string): Promise<number> {
        return this.repository.getShopcartProdCount(userId);
    }
}
