import { Body, Controller, Get, Param, Post, UseInterceptors } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { OrderModule } from '../order.module';
import { Depends } from '@/modules/restful/decorators';
import { PayService } from '../services/pay.service';
import { OrderPayDTO } from '../dtos/order-pay.dto';
import { CurrentUserId } from '@/modules/core/decorators/current-user-id.decorator';
import { PayOrderInfoDto } from '../dtos/pay-order-info.dto';

@ApiTags('支付管理')
@Depends(OrderModule)
@Controller('pay')
export class PayController {
    constructor(protected service: PayService) {}
    /**
     * 结算页完成确认后提交订单
     */
    @Post('normalPay')
    async normalPay(@Body() orderPayDTO: OrderPayDTO, @CurrentUserId() userId: string):Promise<PayOrderInfoDto> {
        return this.service.normalPay(orderPayDTO, userId);
        
    }


    @Post("orderFinishPay")
    async orderFinishPay(@Body() orderNumber: string) {
        await this.service.orderFinishPay(orderNumber);
    }

    // @Post('payNotify')
    // @UseInterceptors(WeChatPayInterceptor)
    // payNotify(@Body() payRawData:string, @CurrentUserId() userId: string) {
    //     this.service.payNotify(payRawData, userId);

    // }

    @Get('queryPayStatus/:orderNumber')
    async queryPayStatus(@Param("orderNumber") orderNumber:string):Promise<boolean> {
        return await this.service.queryPayStatus(orderNumber);
    }

}
