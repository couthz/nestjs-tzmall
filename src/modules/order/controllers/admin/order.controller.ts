import { Body, Controller, Param, Post } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';

import { Order } from '@/modules/order/entities';
import { OrderRepository } from '@/modules/order/repositories';
import { OrderService } from '../../services';
import { OrderModule } from '../../order.module';
import { GetOrderPageDTO } from '../../dtos/get-order-page.dto';
import { Depends } from '@/modules/restful/decorators';
import { RequestBodyAPIDTO } from '@/modules/restful/dtos/request-body-api.dto';
import { PaginateReturn } from '@/modules/database/types';
import { ChangePriceDTO } from '../../dtos/change-price.dto';
import { OrderStatus } from '../../enums/order.enum';
import { SendoutDTO } from '../../dtos/sendout.dto';

@ApiTags('订单管理')
@Depends(OrderModule)
@Controller('order')
export class OrderController {
    constructor(protected service: OrderService,protected repo: OrderRepository) {}

    @Post("page")
    async orderPage(@Body() requestParams: RequestBodyAPIDTO<GetOrderPageDTO>): Promise<PaginateReturn<Order>> {
        const pageinateReturn =  await this.service.getOrdersByStatus(requestParams);
        return pageinateReturn;
    }

    @Post("changePrice")
    changePrice(@Body() changePriceDTO: ChangePriceDTO) {
       this.service.changePrice(changePriceDTO);
    }

    @Post("closeOrder/:orderId")
    closeOrder(@Param("orderId") orderId: string) {
       this.service.closeOrder();
    }

    @Post("sendout")
    sendout(@Body() sendoutDTO: SendoutDTO): Promise<OrderStatus> {
       return this.service.sendout(sendoutDTO);
    }

}

