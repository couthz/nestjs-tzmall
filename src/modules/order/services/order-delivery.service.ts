import { OrderRepository } from './../repositories/order.repository';
//模仿order.service.ts完成
import { Injectable } from '@nestjs/common';
import { OrderItemRepository } from '../repositories';
import { OrderDelivery } from '../entities/order-delivery.entity';
import { BaseService } from '@/modules/database/base';
import { OrderDeliveryRepository } from '../repositories/order-delivery.repository';
import { HttpService } from '@nestjs/axios';
import { catchError, lastValueFrom } from 'rxjs';
import { ApiException } from '@/modules/core/exceptions/api.exception';
import { MD5, enc } from "crypto-js";
import { OrderDeliveryResultDTO } from '../dtos/order-delivery-result.dto';
import { OrderItem } from '../entities';

@Injectable()
export class OrderDeliveryService extends BaseService<OrderDelivery, OrderDeliveryRepository> {
    constructor(
        protected repository: OrderDeliveryRepository,
        protected orderRepository: OrderRepository,
        private readonly httpService: HttpService,
        protected orderItemRepository: OrderItemRepository
    ) {super(repository);}

    async findDeliveryInfoByOrderItems(orderItems: OrderItem[]):Promise<OrderDelivery[]> {
        //1.先通过orderNumber找到所有orderItem
        //2.取出orderItems中每一个项的deliveryId,null值除外
        const deliveryIdsArr = orderItems.map(orderItem => orderItem.deliveryIds).filter(deliveryIds => deliveryIds !== null);
        const deliverySet = new Set<string>();

        for (const deliveryIds of deliveryIdsArr) {

            const deliveryIdArr = deliveryIds.split(',');
            for(const deliveryId of deliveryIdArr) {
                //去重
                deliverySet.add(deliveryId);
            }
        }

                //3.for循环遍历set
        const orderDeliveries:OrderDelivery[] = [];
        for (const deliveryId of deliverySet) {
           //4.通过deliveryId找到对应的orderDelivery
            const orderDelivery = await this.repository.findOneBy({deliveryId});
            //5. 如果没有物流数据，调用远程接口获取物流信息
            if (orderDelivery.deliveryData === null || orderDelivery.deliveryData === undefined || orderDelivery.deliveryData === '') {
                //调用远程接口获取物流信息
                const orderDeliveryResult:OrderDeliveryResultDTO = await this.searchDeliveryData(orderDelivery.deliveryNumber, orderDelivery.dvyFlowCode);
                if (orderDeliveryResult.Success === true) {
                    orderDelivery.deliveryData = JSON.stringify(orderDeliveryResult.Traces);
                    orderDelivery.deliveryState = orderDeliveryResult.State;
                    this.repository.save(orderDelivery);
                }
            }
            orderDeliveries.push(orderDelivery);
        }
        return orderDeliveries;
        
    }


    async searchDeliveryData(dvyFlowNumbers: string, dvyFlowCode:string):Promise<OrderDeliveryResultDTO>  {
    
        const RequestType  = process.env.DVY_SEARCH_TYPE_ID;//免费即时查询接口指令1002/在途监控即时查询接口指令8001/地图版即时查询接口指令8003
        const EBusinessID = process.env.DVY_APP_ID;//即用户ID，登录快递鸟官网会员中心获取 https://www.kdniao.com/UserCenter/v4/UserHome.aspx 
        const ApiKey = process.env.DVY_API_KEY
        // 使用 params 属性传递参数
        const requestData = {
            'ShipperCode': dvyFlowCode,
            'LogisticCode': dvyFlowNumbers,
        };


        const DataSign = MD5(JSON.stringify(requestData)+ApiKey).toString(enc.Base64);

        
        const reqData = {
            RequestType,
            EBusinessID,
            DataSign,
            RequestData:JSON.stringify(requestData),
            DataType:2
        };

        const apiUrl = 'https://api.kdniao.com/Ebusiness/EbusinessOrderHandle.aspx'

        const headers= {
            'Content-Type': 'application/x-www-form-urlencoded'
        }

        const { data } = await lastValueFrom(this.httpService.post<OrderDeliveryResultDTO>(apiUrl, reqData, { headers: headers }).pipe(
            catchError((err) => {

                throw new ApiException(err.response.data.errmsg);
            }
        )));
        return data;
      }
}
