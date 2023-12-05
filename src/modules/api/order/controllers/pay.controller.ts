import { Controller, Post } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { Depends } from '@/common/restful/decorators';
import { OrderService } from '../../../../service/order/services';
import { OrderModule } from '../order.module';

@ApiTags('支付操作')
@Depends(OrderModule)
@Controller('pay')
export class PayController {
    constructor(protected service: OrderService) {}
    /**
     * 结算页完成确认后提交订单
     */
    @Post('normalPay')
    async normalPay() {
        return;
    }
}
