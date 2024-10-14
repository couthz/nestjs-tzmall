import { OrderService } from './order.service';
import { OrderPaymentRepository } from './../repositories/order-payment.repository';
import { Inject, Injectable } from '@nestjs/common';
import WxPay from 'wechatpay-node-v3';

import { WECHAT_PAY_MANAGER } from 'nest-wechatpay-node-v3';
import { Ijsapi } from 'wechatpay-node-v3/dist/lib/interface';
import { OrderPayDTO } from '../dtos/order-pay.dto';
import { UserRepository } from '@/modules/user/repositories';
import { PayOrderInfoDto } from '../dtos/pay-order-info.dto';
import { OrderRepository } from '../repositories';
import { PayNotifyDTO } from '../dtos/pay-notify.dto';
import { Order } from '../entities';
import { OrderCloseType, OrderStatus, PayedStatus } from '../enums/order.enum';
import { ApiException } from '@/modules/core/exceptions/api.exception';

@Injectable()
export class PayService {
    
    constructor(
        protected userRepository: UserRepository,
        protected orderRepository: OrderRepository,
        protected orderPaymentRepository: OrderPaymentRepository,
        protected orderService: OrderService,
        @Inject(WECHAT_PAY_MANAGER) private wxPay: WxPay,
    ) {}

    async normalPay(orderPayDTO: OrderPayDTO, userId: string): Promise<PayOrderInfoDto> {
        //TODO 日志记录用户发起支付
        const openId = await this.userRepository.getOpenIdByUserId(userId);
        const order = await this.orderRepository.getOrderByOrderNumber(orderPayDTO.orderNumber);
        //超时,状态错误,不允许再发起预支付
        if (order.closeType != OrderCloseType.ACTIVE) {
            console.log('订单已超时,不允许发起支付');
            throw new ApiException('订单已超时,请重新下单');
        }

        if (order.status !== OrderStatus.UNPAY) {
            console.log('订单状态错误,不允许发起支付');
            throw new ApiException('订单状态错误,请重新下单');
        }

        const orderPayment = await this.orderPaymentRepository.getOrderPaymentByOrderNumber(
            orderPayDTO.orderNumber,
        );
        orderPayment.initialPayTime = new Date();
        this.orderPaymentRepository.save(orderPayment);
        // const params: Ijsapi = {
        //     appid: process.env.MINIPROGRAM_APP_ID,
        //     mchid: process.env.MCH_ID,
        //     description: '测试',
        //     out_trade_no: orderPayDTO.orderNumber,
        //     notify_url: 'https://www.baidu.com',
        //     // amount: {total: Big(order.actualTotalPay).times(100).toNumber()},
        //     amount: { total: 1 },
        //     payer: { openid: openId },
        // };
        // console.log(params);
        // const payResult = await this.wxPay.transactions_jsapi(params);
        // console.log(payResult);

        // const payOrderInfoDto: PayOrderInfoDto = {
        //     timeStamp: payResult.data.timeStamp,
        //     nonceStr: payResult.data.nonceStr,
        //     package: payResult.data.package,
        //     signType: payResult.data.signType,
        //     paySign: payResult.data.paySign,
        // };
        const payOrderInfoDto = new PayOrderInfoDto();
        return payOrderInfoDto;
    }

    async queryPayStatus(orderNumber: string): Promise<boolean> {
        console.log("查询支付结果中..." + orderNumber);

        let count = 0;
        while (count < 6) {
            const order = await this.orderRepository.getOrderByOrderNumber(orderNumber);

            if (order.status === OrderStatus.PAYED) {
                return true;
            }

            await new Promise((resolve) => setTimeout(resolve, 2500));
            console.log(count);
            count++;
        }

        return false;
    }

    //前端支付完毕后调用
    //不能确保最终支付成功
    async orderFinishPay(orderNumber: string) {
        //1. 根据orderNumber查询订单
        const order = await this.orderRepository.findOneBy({ orderNumber });
        const orderPayment = await this.orderPaymentRepository.findOneBy({ orderNumber });
        //2. 订单状态必须为100,否则抛出api异常
        if (order.status != OrderStatus.UNPAY) {
            //TODO监控 通知
            //TODO日志
            console.log("前端已支付成功,但订单状态错误,请检查");
            throw new ApiException('订单状态错误, 请联系客服');
        }
        //很小的概率已经超时,发起预支付时设置给第三方微信支付同时设置了超时时间,
        //所以能执行到这一步,微信系统内部的支付单就没超时
        if(order.closeType == OrderCloseType.TIMEOUT) {
            //TODO监控 通知
            console.log("前端已支付成功,但订单已超时,请检查商品库存");
            //TODO 回滚,再次扣减库存
        }

        //3. 将订单状态改为支付中
        // order.status = OrderStatus.PAYING;
        //3.1 模拟支付时,由于没有支付成功通知,因此这里直接改为支付成功
        order.status = OrderStatus.PAYED;
        orderPayment.frontendPayTime = new Date();
        await this.orderRepository.save(order);
        this.orderPaymentRepository.save(orderPayment);
    }

    async payNotify(payRawData:string, userId: string) {
        //1.查看数据库订单和支付单,(1)保证幂等性,(2)保证状态流转正确
        const payNotifyDTO: PayNotifyDTO = JSON.parse(payRawData);

        const orderNumber: string = payNotifyDTO.out_trade_no;
        const order: Order = await this.orderRepository.getOrderByOrderNumber(orderNumber);
        if (order.status != OrderStatus.UNPAY) {
            return;
        }

        //2.查看通知结果成功或者失败，
        if(payNotifyDTO.trade_state != 'SUCCESS') {
            console.log('支付通知返回失败状态:'+orderNumber);
            //失败的回滚: 订单支付单,商品库存(失败的话，回滚)
            //TODO 订单状态回滚
            this.orderService.cancelOrder(orderNumber, OrderCloseType.PAYFAIL);
            return;
        }
        //3. 接到通知后对本地数据的修改
        //成功:订单状态,支付单数据
        try {
            const orderPayment = await this.orderPaymentRepository.getOrderPaymentByOrderNumber(orderNumber);
            const successPayTime = new Date();
            order.status = OrderStatus.PAYED;
            order.isPayed = PayedStatus.PAYED;
            order.payTime = successPayTime;
            orderPayment.transactionId = payNotifyDTO.transaction_id;
            orderPayment.payStatus = PayedStatus.PAYED
            orderPayment.payTime = successPayTime;
            orderPayment.payRawData = payRawData;
            await this.orderRepository.save(order);
            await this.orderPaymentRepository.save(orderPayment);
        } catch (error) {
            console.log('支付成功,订单状态更新失败'+orderNumber);
            throw new ApiException('支付成功,订单状态更新失败');
        }
    }
}
