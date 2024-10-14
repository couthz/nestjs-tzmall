import { Processor, Process } from '@nestjs/bull';
import { Job } from 'bull';
import { OrderService } from '../order/services';
import { OrderCloseType } from '../order/enums/order.enum';

@Processor('order')
export class OrderProcessor {
    constructor(private readonly orderService: OrderService) {}

    @Process('cancelOrder')
    handleCancelOrder(job: Job) {
        const { orderNumber } = job.data;
        this.orderService.cancelOrder(orderNumber,OrderCloseType.PAYFAIL);
    }
}