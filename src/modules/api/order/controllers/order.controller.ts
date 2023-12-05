import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { Depends } from '@/common/restful/decorators';
import { OrderService } from '../../../../service/order/services';
import { OrderModule } from '../order.module';
import { BuynowGetCheckOutDTO } from '@/service/order/dtos/buynow-get-checkout.dto';
import { CheckOutDTO } from '@/service/order/dtos/checkout.dto';
import { ShopcartGetCheckOutDTO } from '@/service/order/dtos/shopcart-get-checkout.dto';
import { CurrentUserId } from '@/common/core/decorators/current-user-id.decorator';
import { GetOrderPageDTO } from '@/service/order/dtos/get-order-page.dto';
import { PaginateReturn } from '@/common/database/types';
import { Order } from '@/service/order/entities';
import { OrderRepository } from '@/service/order/repositories';

@ApiTags('订单操作')
@Depends(OrderModule)
@Controller('order')
export class OrderController {
    constructor(protected service: OrderService,protected repo: OrderRepository) {}

    @Get("orderDetail/:orderNumber")
    async orderDetail(@Param("orderNumber") orderNumber: string): Promise<Order> {
        return await this.service.getOrderDetailByOrderNumber(orderNumber);
    }

    @Post("orderPage")
    async orderPage(@Body() getOrderPageDTO: GetOrderPageDTO, @CurrentUserId() userId: string): Promise<PaginateReturn<Order>> {
        const pageinateReturn =  await this.service.getOrdersByUserIdAndStatus(getOrderPageDTO, userId);
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
    async submit(@CurrentUserId() userId: string): Promise<string> {
        return this.service.submit(userId);
    }

}

