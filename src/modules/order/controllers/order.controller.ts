import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { BuynowGetCheckOutDTO } from '@/modules/order/dtos/buynow-get-checkout.dto';
import { CheckOutDTO } from '@/modules/order/dtos/checkout.dto';
import { ShopcartGetCheckOutDTO } from '@/modules/order/dtos/shopcart-get-checkout.dto';

import { Order } from '@/modules/order/entities';
import { OrderRepository } from '@/modules/order/repositories';
import { OrderService } from '../services';
import { OrderModule } from '../order.module';
import { GetOrderPageDTO } from '../dtos/get-order-page.dto';
import { Depends } from '@/modules/restful/decorators';
import { RequestBodyAPIDTO } from '@/modules/restful/dtos/request-body-api.dto';
import { CurrentUserId } from '@/modules/core/decorators/current-user-id.decorator';
import { PaginateReturn } from '@/modules/database/types';
import { OrderSubmmitDTO } from '../dtos/order-submmit.dto';
import { OrderDetailDTO } from '../dtos/order-detail.dto';

@ApiTags('订单管理')
@Depends(OrderModule)
@Controller('order')
export class OrderController {
    constructor(protected service: OrderService,protected repo: OrderRepository) {}

    @Get("orderDetail/:orderNumber")
    async orderDetail(@Param("orderNumber") orderNumber: string): Promise<OrderDetailDTO> {
        return await this.service.getOrderDetailByOrderNumber(orderNumber);
    }

    @Post("orderPage")
    async orderPage(@Body() requestParams: RequestBodyAPIDTO<GetOrderPageDTO>, @CurrentUserId() userId: string): Promise<PaginateReturn<Order>> {

        const pageinateReturn =  await this.service.getOrdersByUserIdAndStatus(requestParams, userId);
        return pageinateReturn;
    }
    /**
     * 点击"立即购买"按钮后，请求结算信息
     */
    @Post('buynowGetCheckOut')
    async buynowGetCheckOut(@Body() body: BuynowGetCheckOutDTO, @CurrentUserId() userId: string): Promise<CheckOutDTO> {
        return this.service.buynowGetCheckOut(body, userId);
    }

    /**
     * 购物车点击结算按钮后，请求结算信息
     */
    @Post('shopcartGetCheckOut')
    async shopcartGetCheckOut(@Body() body: ShopcartGetCheckOutDTO, @CurrentUserId() userId: string): Promise<CheckOutDTO> {
        return this.service.shopcartGetCheckOut(body, userId);
    }

    /**
     * 结算页完成确认后提交订单
     */
    @Post('submit')
    async submit(@Body()orderSubmmitDTO: OrderSubmmitDTO ,@CurrentUserId() userId: string): Promise<string> {
        return this.service.submit(orderSubmmitDTO, userId);
    }



}

