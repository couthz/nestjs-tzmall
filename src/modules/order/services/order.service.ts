import { OrderDeliveryService } from './order-delivery.service';
import { OrderDelivery } from './../entities/order-delivery.entity';
import { OrderDeliveryRepository } from './../repositories/order-delivery.repository';
import { UserRepository } from '@/modules/user/repositories';
import { ShopcartItemService } from '@/modules/shopcart/services/shopcart-item.service';
import { OrderCloseType, OrderStatus, PayType, PayedStatus } from '../enums/order.enum';
import { OrderAddrRepository } from '../repositories/order-addr.repository';
import { UserAddrRepository } from '../../user/repositories/user-addr.repository';
import { CheckOutSkuDTO } from '../dtos/checkout-sku.dto';

import { CheckOutDTO } from '../dtos/checkout.dto';
import { OrderRepository } from '../repositories/order.repository';
import { Order } from '../entities/order.entity';
import { SkuRepository, ProdRepository } from '@/modules/prod/repositories';
import { BuynowGetCheckOutDTO } from '../dtos/buynow-get-checkout.dto';
import { ShopcartGetCheckOutDTO } from '../dtos/shopcart-get-checkout.dto';
import { ShopcartItemRepository } from '@/modules/shopcart/repositories/shopcart-item.repository';
import { Sku } from '@/modules/prod/entities';
import { OrderItem } from '../entities/order-item.entity';
import { OrderItemRepository } from '../repositories/order-item.repository';
import { OrderPaymentRepository } from '../repositories/order-payment.repository';
import { Injectable } from '@nestjs/common';
import { OrderAddr } from '../entities';
import Redis from 'ioredis';
import { OrderDeliveryStatus, OrderItemCommentStatus } from '../enums/order.enum';
import { DataSource, SelectQueryBuilder } from 'typeorm';
import { GetOrderPageDTO } from '../dtos/get-order-page.dto';
import { BaseService } from '@/modules/database/base';
import { RedisClientService } from '@/modules/redis/redis-client.service';
import { RequestBodyAPIDTO } from '@/modules/restful/dtos/request-body-api.dto';
import { PaginateReturn } from '@/modules/database/types';
import { REDIS_KEYS } from '@/modules/redis/redis-keys';
import { ApiException } from '@/modules/core/exceptions/api.exception';
import Big from 'big.js';
import { ChangePriceDTO } from '../dtos/change-price.dto';
import { SendoutDTO } from '../dtos/sendout.dto';
import { User } from '@/modules/user/entities';
import { CommonStatus } from '@/modules/core/constants/enums';
import { OrderSubmmitDTO } from '../dtos/order-submmit.dto';
import { OrderDetailDTO } from '../dtos/order-detail.dto';
import { InjectQueue } from '@nestjs/bull';
import { Queue } from 'bull';

@Injectable()
export class OrderService extends BaseService<Order, OrderRepository> {
    
    
    

    private readonly redisClient: Redis;

    constructor(
        protected repository: OrderRepository,
        protected userAddrRepository: UserAddrRepository,
        protected userRepository: UserRepository,
        protected skuRepository: SkuRepository,
        protected prodRepository: ProdRepository,
        protected shopcartItemService: ShopcartItemService,
        protected shopcartItemRepository: ShopcartItemRepository,
        protected orderItemRepository: OrderItemRepository,
        protected orderPaymentRepository: OrderPaymentRepository,
        protected orderAddrRepository: OrderAddrRepository,
        protected orderDeliveryService: OrderDeliveryService,
        protected orderDeliveryRepository : OrderDeliveryRepository,
        protected redisClientService: RedisClientService,
        protected dataSource: DataSource,
        @InjectQueue('order') private readonly orderQueue: Queue,
    ) {
        super(repository);
        this.redisClient = redisClientService.getClient();
    }

    async getOrderDetailByOrderNumber(orderNumber: string): Promise<OrderDetailDTO> {
         const order = await this.repository.getOrderDetailByOrderNumber(orderNumber);
         let orderDeliveryInfos:OrderDelivery[] = [];
         if (order.status == OrderStatus.DELIVERED || order.status == OrderStatus.PARTIALDELIVERED) {
            orderDeliveryInfos = await this.orderDeliveryService.findDeliveryInfoByOrderItems(order.orderItems);
         }
         return {order, orderDeliveryInfos};
    }

    async getOrdersByStatus(
        requestParams: RequestBodyAPIDTO<GetOrderPageDTO>,
    ): Promise<PaginateReturn<Order>> {
        const { status } = requestParams.params;

        const addQuery = async (qb: SelectQueryBuilder<Order>) => {
            if (status != OrderStatus.ALL) {
                if (status == OrderStatus.PAYED) {
                    qb.andWhere('order.status in (:...multiStatus)', { multiStatus: [status, OrderStatus.PARTIALDELIVERED] });
                } 
                else  {
                    qb.where('order.status = :status', { status });

                }
            }
            qb.leftJoinAndMapMany(
                'order.orderItems',
                OrderItem,
                'orderItem',
                'orderItem.order_id = order.order_id',
            );
            qb.leftJoinAndMapOne(
              'order.orderAddr',
              OrderAddr,
              'orderAddr',
              'orderAddr.order_addr_id = order.order_addr_id',
          );
            return qb;
        };

        return await super.paginate(requestParams.page, addQuery);
    }

    async getOrdersByUserIdAndStatus(
        requestParams: RequestBodyAPIDTO<GetOrderPageDTO>,
        userId: string,
    ): Promise<PaginateReturn<Order>> {
        const { status } = requestParams.params;

        const addQuery = async (qb: SelectQueryBuilder<Order>) => {
            qb.where('order.user_id = :userId', { userId });
            if (status != OrderStatus.ALL && status != OrderStatus.DELIVERED && status!= OrderStatus.PAYED) {
                qb.andWhere('order.status = :status', { status });
            }
            else if(status == OrderStatus.DELIVERED) {
                //选出状态为102和105的订单
                qb.andWhere('order.status in (:...multiStatus)', { multiStatus: [OrderStatus.DELIVERED, OrderStatus.PARTIALDELIVERED] });
            }
            else if(status == OrderStatus.PAYED) {
                qb.andWhere('order.status in (:...multiStatus)', { multiStatus: [OrderStatus.PAYED, OrderStatus.PAYING] });

            }
            //按照更新时间倒序排列
            qb.orderBy('order.updateTime', 'DESC');

        
            qb.leftJoinAndMapMany(
                'order.orderItems',
                OrderItem,
                'orderItem',
                'orderItem.order_id = order.order_id',
            );
            //连接tz_order_addr,但只查询该表的addr_id列,不查询其他列
            if (status == OrderStatus.PAYED) {
                qb.leftJoinAndMapOne(
                    'order.orderAddr',
                    OrderAddr,
                    'orderAddr',
                    'orderAddr.order_addr_id = order.order_addr_id',
                );
            }
            return qb;
        };

        return await super.paginate(requestParams.page, addQuery);
    }

    //根据立即购买的商品的skuId
    async buynowGetCheckOut(
        buynowGetCheckOutDTO: BuynowGetCheckOutDTO,
        userId: string,
    ): Promise<CheckOutDTO> {
        const sku = await this.skuRepository.findOneBy({
            skuId: buynowGetCheckOutDTO.buynowSkuDTO.skuId,
        });
        let checkOutSkuDTO = new CheckOutSkuDTO();
        Object.assign(checkOutSkuDTO, sku);
        checkOutSkuDTO.itemCount = buynowGetCheckOutDTO.buynowSkuDTO.itemCount;
        checkOutSkuDTO.totalPay = Big(sku.price).times(checkOutSkuDTO.itemCount).toFixed(2);
        return this.getCheckOut([checkOutSkuDTO], userId);
    }

    //根据购物车选中的商品 获取完整的商品信息
    async shopcartGetCheckOut(
        shopcartGetCheckOutDTO: ShopcartGetCheckOutDTO,
        userId: string,
    ): Promise<CheckOutDTO> {
        const shopcartItems = await this.shopcartItemService.getCheckedShopcartItemsByUserId(userId);

        // const shopcartItems = await this.shopcartItemRepository.getShopcartItemsAndProdsByIds(
        //     shopcartGetCheckOutDTO.shopcartItemIds,
        // );
        const checkOutSkuDTOs: CheckOutSkuDTO[] = shopcartItems.map((shopcartItem) => {
            let checkoutSkuDTO = new CheckOutSkuDTO();
            Object.assign(checkoutSkuDTO, shopcartItem.sku);
            checkoutSkuDTO.itemCount = shopcartItem.itemCount;
            checkoutSkuDTO.shopcartItemId = shopcartItem.shopcartItemId;
            const skuPrice = Big(shopcartItem.sku.price);
            checkoutSkuDTO.totalPay = skuPrice.times(shopcartItem.itemCount).toFixed(2);
            checkoutSkuDTO.addShopcartDate = shopcartItem.addDate;
            return checkoutSkuDTO;
        });
        return this.getCheckOut(checkOutSkuDTOs, userId);
    }

    //返回给前端结算页面的信息
    async getCheckOut(
        checkoutSkuDTOs: CheckOutSkuDTO[],
        userId: string,
    ): Promise<CheckOutDTO> {
        const userAddr = await this.userAddrRepository.findDefaultAddrByUserId(userId);
        //TODO 优惠券

        //计算结算单总金额和总数量
        const checkOutDTO = new CheckOutDTO();

        let totalPay = Big('0');
        let totalCount = 0;
        checkoutSkuDTOs.forEach((checkoutSkuDTO) => {
            totalPay = totalPay.plus(checkoutSkuDTO.totalPay);
            totalCount += checkoutSkuDTO.itemCount;
        });
        checkOutDTO.totalPay = totalPay.toFixed(2);
        checkOutDTO.totalCount = totalCount;
        checkOutDTO.checkOutSkuDTOs = checkoutSkuDTOs;
        checkOutDTO.userAddr = userAddr;
        
        //TODO 运费
        checkOutDTO.transfee = '0.00';
        //将结算信息checkoutDTO存入redis,避免提交订单时重复计算价格
        this.redisClient.set(REDIS_KEYS.ORDER_CHECKOUT_KEY, JSON.stringify(checkOutDTO));
        return checkOutDTO;
    }

    //TODO应该有一个修改结算页信息的接口,修改后重新计算价格,然后返回给前端,同时修改redis

    async submit(orderSubmmitDTO: OrderSubmmitDTO, userId: string): Promise<string> {
        const checkOutDTOJson = await this.redisClient.get(REDIS_KEYS.ORDER_CHECKOUT_KEY);

        const checkOutDTO = JSON.parse(checkOutDTOJson);

        if (checkOutDTO == null) {
            throw new ApiException('订单已过期，请重新下单');
        }

        //保存提交时才传过来的参数
        checkOutDTO.buyerRemark = orderSubmmitDTO.remarks;

        const orderNumber = await this.submitOrder(checkOutDTO, userId);

        //提交订单后删除redis中的结算信息
        this.redisClient.del(REDIS_KEYS.ORDER_CHECKOUT_KEY);
        //返回订单号
        return orderNumber;
    }

    //创建订单和订单item,返回订单号
    async submitOrder(checkOutDTO: CheckOutDTO, userId: string): Promise<string> {
        const queryRunner = this.dataSource.createQueryRunner();

        await queryRunner.connect();
        await queryRunner.startTransaction();
        try {
            //业务类型1位(下单、退款),秒时间戳,四位随机数,用户id后四位
            const bussinessType = '1';
            const timestamp = Math.floor(new Date().getTime() / 1000);
            //生成四位随机整数
            const random = Math.floor(Math.random() * 9000) + 1000;
            const lastFourDigits = userId.slice(-4);    
            const orderNumber = `${bussinessType}${timestamp}${random}${lastFourDigits}`;
            //创建并插入order

            //TODO计算运费

            //根据userId查询用户
            const user = await this.userRepository.findOneBy({ userId: userId });

            const orderId = await this.createOrder(orderNumber, user, checkOutDTO);

            //创建并插入orderItem
            let shopcartItemIds: string[] = [];
            let orderItems: OrderItem[] = [];
            for (const checkOutSkuDTO of checkOutDTO.checkOutSkuDTOs) {
                const sku = await this.checkAndGetSku(
                    checkOutSkuDTO.skuId,
                    checkOutSkuDTO.itemCount,
                );
                const orderItem = await this.createOrderItem(
                    orderNumber,
                    sku,
                    checkOutSkuDTO,
                    orderId,
                    userId,
                );
                orderItems.push(orderItem);
                if (checkOutSkuDTO.shopcartItemId != null && checkOutSkuDTO.shopcartItemId != '') {
                    shopcartItemIds.push(checkOutSkuDTO.shopcartItemId);
                }
            }
            if (shopcartItemIds.length > 0) {
                //提交订单时删除购物车中的商品
                await this.shopcartItemRepository.deleteShopcartItemsByIds(shopcartItemIds);
            }
            //创建订单支付单
            await this.createOrderPayment(orderNumber, userId, checkOutDTO);
            //30分钟超时
            // await this.orderQueue.add('cancelOrder', { orderNumber }, { delay: 1000 * 60 * 30 });
            return orderNumber;
        } catch (err) {
            await queryRunner.rollbackTransaction();
            throw err;
        } finally {
            await queryRunner.release();
        }
    }

    async createOrderItem(
        orderNumber: string,
        sku: Sku,
        checkOutSkuDTO: CheckOutSkuDTO,
        orderId: string,
        userId: string,
    ): Promise<OrderItem> {
        let orderItem = await this.orderItemRepository.create({
            orderNumber,
            orderId,
            prodId: sku.prodId,
            skuId: sku.skuId,
            skuName: sku.skuName,
            prodName: sku.prodName,
            itemCount: checkOutSkuDTO.itemCount,
            pic: sku.pic,
            totalPay: checkOutSkuDTO.totalPay,
            price: checkOutSkuDTO.price,
            userId,
            addShopcartDate: checkOutSkuDTO.addShopcartDate,
            commSts: OrderItemCommentStatus.UNCOMMENT,
            aftersaleStatus: 0, //售后
            deliveryStatus: OrderDeliveryStatus.UNDELIVERED,
        });
        this.orderItemRepository.insert(orderItem);
        return orderItem;
    }

    async createOrder(
        orderNumber: string,
        user: User,
        checkOutDTO: CheckOutDTO,
    ): Promise<string> {
        const orderAddr = await this.createOrderAddr(checkOutDTO);

        const createOrder = {
            orderNumber,
            userId: user.userId,
            totalCount: checkOutDTO.totalCount,
            totalPay: checkOutDTO.totalPay,
            transfee: checkOutDTO.transfee,
            status: OrderStatus.UNPAY,
            actualTotalPay: Big(checkOutDTO.totalPay).add(Big(checkOutDTO.transfee)).toFixed(2),
            isPayed: PayedStatus.UNPAYED,
            buyerRemark: checkOutDTO.buyerRemark,
            userMobile: user.userMobile, 
            userWechat: user.userWechat, //TODO
            orderAddrId: orderAddr.orderAddrId,
        };

        const order = await this.repository.create(createOrder);
        await this.repository.insert(order);
        return order.orderId;
    }
    async createOrderAddr(checkOutDTO: CheckOutDTO): Promise<OrderAddr> {
        let orderAddr = await this.orderAddrRepository.create({ ...checkOutDTO.userAddr });
        return this.orderAddrRepository.save(orderAddr);
    }

    async createOrderPayment(orderNumber: string, userId: string, checkOutDTO: CheckOutDTO) {
        const bussinessType = '3';
        const timestamp = Math.floor(new Date().getTime() / 1000);
        //生成四位随机整数
        const random = Math.floor(Math.random() * 9000) + 1000;
        const lastFourDigits = userId.slice(-4);    
        const payNo = `${bussinessType}${timestamp}${random}${lastFourDigits}`;

        const orderPayment = await this.orderPaymentRepository.create({
            actualTotalPay: Big(checkOutDTO.totalPay).add(Big(checkOutDTO.transfee)).toFixed(2),
            payNo,
            payType: PayType.WECAHT,
            payTypeName: '微信支付',
            payStatus: PayedStatus.UNPAYED,
            isClearing: CommonStatus.INACTIVE, //TODO 清算??
            orderNumber,
            userId,
        });
        this.orderPaymentRepository.save(orderPayment);
    }

    async checkAndGetSku(skuId: string, itemCount: number): Promise<Sku> {
        const sku = await this.skuRepository.findOneBy({ skuId: skuId });
        const prod = await this.prodRepository.findOneBy({ prodId: sku.prodId });
        if (sku == null) {
            throw new ApiException('商品不存在');
        }

        if (sku.stocks < itemCount) {
            throw new ApiException('商品库存不足');
        }
        //TODO 这里先固定成下单减库存
        sku.stocks -= itemCount;
        prod.totalStocks -= itemCount;
        await this.skuRepository.save(sku);
        await this.prodRepository.save(prod);
        return sku;
    }

    async changePrice(changePriceDTO: ChangePriceDTO) {
        const order = await this.repository.findOneBy({ orderId: changePriceDTO.orderId });
        if (order == null) {
            throw new ApiException('订单不存在');
        }
        const oldTransfee = Big(order.transfee);
        const oldChangePrice = Big(order.changePrice)
        const transfee = Big(changePriceDTO.transfee);
        const changePrice = Big(changePriceDTO.changePrice);
        const diff = transfee.plus(changePrice).minus(oldTransfee).minus(oldChangePrice);
        const actualTotalPay = Big(order.actualTotalPay).plus(diff);
        if (actualTotalPay.eq(changePriceDTO.actualTotalPay) == false) {    
            throw new ApiException('前台实际支付金额计算错误');
        }   

        order.transfee = changePriceDTO.transfee;
        order.changePrice = changePriceDTO.changePrice;
        order.actualTotalPay = actualTotalPay.toFixed(2);
        
        this.repository.save(order);
    }

    closeOrder() {
        this.repository.closeOrder();
    }

    async sendout(sendoutDTO: SendoutDTO): Promise<OrderStatus> {
        //0. for循环遍历flowNumbers,创建orderDelivery
        const orderDeliveryIds: string[] = [];
        for (const flowNumber of sendoutDTO.flowNumbers) {
            var dvyFlowCode = "";
            //TODO 申通STO 圆通YTO 百世HTKY
            //如果flowNumber以"YT"开头,dvyFlowCode变量赋值为YTO
            if (flowNumber.startsWith("YT")) {
                dvyFlowCode = "YTO";
            } else if (flowNumber.startsWith("77")) {
                dvyFlowCode = "STO";
            } else {
                dvyFlowCode = "HTKY";
            }
            const newOrderDelivery = this.orderDeliveryRepository.create({deliveryNumber: flowNumber, dvyFlowCode: dvyFlowCode,});
            const orderDelivery = await this.orderDeliveryRepository.save(newOrderDelivery);
            orderDeliveryIds.push(orderDelivery.deliveryId);
        }
        //1. 更新订单中选中的item的发货状态为已发货,并且填写单号
        //2. 如果全部item都已发货,则更返回true，否则返回false
        const deliveryResult: boolean = await this.orderItemRepository.sendout(sendoutDTO.orderId, sendoutDTO.selectedOrderItems, orderDeliveryIds)
        //2. 如果全部item都已发货,则更新订单的发货状态为已发货,否则改为部分发货
        let statusResult = OrderStatus.DELIVERED;
        if (deliveryResult) {
            this.repository.update(sendoutDTO.orderId, { status: OrderStatus.DELIVERED });
        } else {
            statusResult = OrderStatus.PARTIALDELIVERED;
            this.repository.update(sendoutDTO.orderId, { status: OrderStatus.PARTIALDELIVERED });
        }
        //3.修改买家地址
        this.orderAddrRepository.updateBy(sendoutDTO.orderAddrDTO);
        return statusResult;
    }


    async cancelOrder(orderNumber: string, closeType: OrderCloseType) {
        const order = await this.repository.getOrderByOrderNumber(orderNumber);
        if (order.status == OrderStatus.UNPAY) {
            order.status = OrderStatus.CLOSE;
            order.closeType = closeType;
            order.cancelTime = new Date();
            this.repository.save(order);

            const orderItems = order.orderItems;
            for (const orderItem of orderItems) {
                const sku = await this.skuRepository.findOneBy({ skuId: orderItem.skuId });
                const prod =  await this.prodRepository.findOneBy({ prodId: sku.prodId });
                sku.stocks += orderItem.itemCount;
                prod.totalStocks += orderItem.itemCount;
                await this.skuRepository.save(sku);
                await this.prodRepository.save(prod);
            }
        }
    }
}

//TODO监听者任务:补充订单剩余快照,如地址信息,用户信息等,
//这类信息基本不会出现在用户端界面,一般是后台管理人员需要用到
