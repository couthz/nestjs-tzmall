//模仿order.controller.ts完成
import {  Controller } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';

import { OrderModule } from '../order.module';
import { Depends } from '@/modules/restful/decorators';
import { OrderDeliveryService } from '../services/order-delivery.service';

@ApiTags('支付管理')
@Depends(OrderModule)
@Controller('pay')
export class OrderDeliveryController {
    constructor(protected service: OrderDeliveryService) {}
    /**
     * 结算页完成确认后提交订单
     */
    // @Post('normalPay')
    // async normalPay(@Body() orderPayDTO: OrderPayDTO, @CurrentUserId() userId: string):Promise<PayOrderInfoDto> {
    //     return this.service.normalPay(orderPayDTO, userId);
    // }

}