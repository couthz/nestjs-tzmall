import { OrderStatus, PayedStatus } from './../enums/order.enum';
import { OrderAddrRepository } from './../repositories/order-addr.repository';
import { GetCheckOutDTO } from './../dtos/get-checkout.dto';
import { UserAddrRepository } from './../../user/repositories/user-addr.repository';
import { CheckOutSkuDTO } from '../dtos/checkout-sku.dto';

import { CheckOutDTO } from '../dtos/checkout.dto';
import { BaseService } from "@/common/database/base";
import { OrderRepository } from "../repositories/order.repository";
import { Order } from "../entities/order.entity";
import { SkuRepository } from '@/service/prod/repositories';
import { BuynowGetCheckOutDTO } from '../dtos/buynow-get-checkout.dto';
import { ShopcartGetCheckOutDTO } from '../dtos/shopcart-get-checkout.dto';
import { ShopcartItemRepository } from '@/service/shopcart/repositories/shopcart-item.repository';
import Big from 'big.js';
import { v4 as uuid } from 'uuid';
import { ApiException } from '@/common/core/exceptions/api.exception';
import { Sku } from '@/service/prod/entities';
import { OrderItem } from '../entities/order-item.entity';
import { OrderItemRepository } from '../repositories/order-item.repository';
import { OrderPaymentRepository } from '../repositories/order-payment.repository';
import { Injectable } from '@nestjs/common';
import { OrderAddr } from '../entities';
import { RedisClientService } from '@/common/redis/redis-client.service';
import Redis from 'ioredis';
import { REDIS_KEYS } from '@/common/redis/redis-keys';
import { OrderDeliveryStatus, OrderItemCommentStatus } from '../enums/order.enum';
import { DataSource, SelectQueryBuilder } from "typeorm";
import { GetOrderPageDTO } from '../dtos/get-order-page.dto';
import { PaginateReturn } from '@/common/database/types';

@Injectable()
export class OrderService extends BaseService<Order, OrderRepository> {


  private readonly redisClient: Redis;

  constructor(
    protected repository: OrderRepository,
    protected userAddrRepository: UserAddrRepository,
    protected skuRepository: SkuRepository,
    protected shopcartItemRepository: ShopcartItemRepository,
    protected orderItemRepository: OrderItemRepository,
    protected orderPaymentRepository: OrderPaymentRepository,
    protected orderAddrRepository: OrderAddrRepository,
    protected redisClientService: RedisClientService,
    protected dataSource: DataSource
  ) {
    super(repository);
    this.redisClient = redisClientService.getClient();
  }

  async getOrderDetailByOrderNumber(orderNumber: string) {
    return await this.repository.getOrderDetailByOrderNumber(orderNumber);
  }

  async getOrdersByUserIdAndStatus(getOrderPageDTO: GetOrderPageDTO, userId: string): Promise<PaginateReturn<Order>> {

        const { status } = getOrderPageDTO;

        const addQuery = async (qb: SelectQueryBuilder<Order>) => {
          qb.where('order.user_id = :userId', { userId })
          console.log(status);
          if (status != OrderStatus.ALL) {
            qb.andWhere('order.status = :status', { status })
          }
          qb.leftJoinAndMapMany('order.orderItems', OrderItem, 'orderItem', 'orderItem.order_id = order.order_id')
          return qb; 
        };
        

        return await super.paginate(
            getOrderPageDTO,
            addQuery,
        );

  }

  //根据立即购买的商品的skuId
  async buynowGetCheckOut(buynowGetCheckOutDTO: BuynowGetCheckOutDTO,userId: string): Promise<CheckOutDTO> {
    const sku = await this.skuRepository.findOneBy({skuId: buynowGetCheckOutDTO.buynowSkuDTO.skuId});
    let checkOutSkuDTO = new CheckOutSkuDTO();
    Object.assign(checkOutSkuDTO, sku);
    checkOutSkuDTO.itemCount = buynowGetCheckOutDTO.buynowSkuDTO.itemCount;
    checkOutSkuDTO.totalPay = Big(sku.price).times(checkOutSkuDTO.itemCount).toFixed(2);
    return this.getCheckOut([checkOutSkuDTO], buynowGetCheckOutDTO, userId);
  }

  //根据购物车选中的商品 获取完整的商品信息
  async shopcartGetCheckOut(shopcartGetCheckOutDTO: ShopcartGetCheckOutDTO,userId: string): Promise<CheckOutDTO> {
    const shopcartItems = await this.shopcartItemRepository.getShopcartItemsAndProdsByIds(shopcartGetCheckOutDTO.shopcartItemIds);
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
    return this.getCheckOut(checkOutSkuDTOs, shopcartGetCheckOutDTO,userId);
  }

  //返回给前端结算页面的信息
  async getCheckOut(checkoutSkuDTOs: CheckOutSkuDTO[], getCheckOutDTO: GetCheckOutDTO, userId: string): Promise<CheckOutDTO> {
    //TODO 默认显示在结算页上的用户地址
    const userAddr =  await this.userAddrRepository.findDefalutAddrByUserId(userId);
    //TODO 运费
    //TODO 优惠券

    //计算结算单总金额和总数量
    const checkOutDTO = new CheckOutDTO();

    let totalPay = Big("0");
    let totalCount = 0;
    checkoutSkuDTOs.forEach((checkoutSkuDTO) => {
        totalPay = totalPay.plus(checkoutSkuDTO.totalPay);
        totalCount += checkoutSkuDTO.itemCount;
    });
    checkOutDTO.totalPay = totalPay.toFixed(2);
    checkOutDTO.totalCount = totalCount;
    checkOutDTO.checkOutSkuDTOs = checkoutSkuDTOs;
    checkOutDTO.userAddr = userAddr;
    //将结算信息checkoutDTO存入redis,避免提交订单时重复计算价格
    this.redisClient.set(REDIS_KEYS.ORDER_CHECKOUT_KEY, JSON.stringify(checkOutDTO));
    return checkOutDTO;
  }

  //TODO应该有一个修改结算页信息的接口,修改后重新计算价格,然后返回给前端,同时修改redis

  async submit(userId: string): Promise<string> {
    const checkOutDTOJson = await this.redisClient.get(REDIS_KEYS.ORDER_CHECKOUT_KEY);

    const checkOutDTO = JSON.parse(checkOutDTOJson);

    if (checkOutDTO == null) {
      throw new ApiException("订单已过期，请重新下单");
    }

    const orderNumber = await this.submitOrder(checkOutDTO, userId)
    //TODO redis中删除结算信息
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
        //TODO 之后改用更加具有业务属性的orderNumber
      const orderNumber = uuid();
      //创建并插入order
      const orderId = await this.createOrder(orderNumber, userId, checkOutDTO)

      //创建并插入orderItem
      let shopcartItemIds: string[] = [];
      let orderItems: OrderItem[] = [];
      checkOutDTO.checkOutSkuDTOs.forEach(async (checkOutSkuDTO) => {
          const sku = await this.checkAndGetSku(checkOutSkuDTO.skuId, checkOutSkuDTO.itemCount);
          const orderItem = await this.createOrderItem(orderNumber, sku, checkOutSkuDTO, orderId, userId);
          orderItems.push(orderItem);
          if (checkOutSkuDTO.shopcartItemId != null && checkOutSkuDTO.shopcartItemId != "") {
            shopcartItemIds.push(checkOutSkuDTO.shopcartItemId);
          }
      });
      if (shopcartItemIds.length > 0) {
        //提交订单时删除购物车中的商品
        this.shopcartItemRepository.deleteShopcartItemsByIds(shopcartItemIds);
      }
      //创建订单支付单
      this.createOrderPayment(orderNumber, userId, checkOutDTO);
      return orderNumber;
    } catch (err) {
      await queryRunner.rollbackTransaction();
      throw err;
    } finally {
      await queryRunner.release();
    }
  }

  async createOrderItem(orderNumber: string, sku: Sku, checkOutSkuDTO: CheckOutSkuDTO, orderId:string, userId: string): Promise<OrderItem> {
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
      aftersaleStatus: 0, //TODO售后
      deliveryStatus: OrderDeliveryStatus.UNDELIVERED,
    });
    this.orderItemRepository.insert(orderItem);
    return orderItem;
  }

  async createOrder(orderNumber: string, userId: string, checkOutDTO: CheckOutDTO): Promise<string> {
    const orderAddr = await this.createOrderAddr(checkOutDTO);

    const createOrder = {
      orderNumber,
      userId,
      totalCount: checkOutDTO.totalCount,
      totalPay: checkOutDTO.totalPay,
      transfee: checkOutDTO.transfee,
      status: OrderStatus.UNPAY, 

      isPayed: PayedStatus.UNPAYED,
      buyerRemark: checkOutDTO.buyerRemark,
      userMobile: "",//TODO
      userWechat: "",//TODO
      orderAddrId: orderAddr.orderAddrId,
    }

    const order = await this.repository.create(createOrder);
    await this.repository.insert(order);
    return order.orderId;
  }
  async createOrderAddr(checkOutDTO: CheckOutDTO): Promise<OrderAddr> {
    let orderAddr = await this.orderAddrRepository.create({ ...checkOutDTO.userAddr });
    return this.orderAddrRepository.save(orderAddr);
  }

  async createOrderPayment(orderNumber: string, userId: string, checkOutDTO: CheckOutDTO) {
    const orderPayment = await this.orderPaymentRepository.create({
      totalPay: checkOutDTO.totalPay,
      payStatus: PayedStatus.UNPAYED,
      isClearing: 0, //TODO
      orderNumber,
      userId,
    });
    this.orderPaymentRepository.save(orderPayment);
  }

  async checkAndGetSku(skuId: string, itemCount: number): Promise<Sku> {
    const sku = await this.skuRepository.findOneBy({skuId: skuId});
    if (sku == null) {
      throw new ApiException("商品不存在");
    }

    if (sku.stocks < itemCount) {
      throw new ApiException("商品库存不足");
    }
    //TODO 这里先固定成下单减库存
    sku.stocks -= itemCount;
    this.skuRepository.save(sku);
    return sku;
  }
}

//TODO监听者任务:补充订单剩余快照,如地址信息,用户信息等,
//这类信息基本不会出现在用户端界面,一般是后台管理人员需要用到
