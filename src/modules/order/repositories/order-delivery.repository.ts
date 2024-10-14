//模仿order-addr.repository.ts，创建order-delivery.repository.ts
import { BaseRepository } from '@/modules/database/base';
import { OrderDelivery } from '../entities/order-delivery.entity';
import { CustomRepository } from '@/modules/database/decorators';


@CustomRepository(OrderDelivery)
export class OrderDeliveryRepository extends BaseRepository<OrderDelivery> {
    
    protected _qbName = "orderDelivery";
    // Custom methods and queries can be added here
    buildBaseQB() {
        return this.createQueryBuilder('orderDelivery');
    }

    findDeliveryByFlowNumber(flowNumber: string) {
        return this.buildBaseQB()
            .where('dvy_flow_numbers = :flowNumber', { flowNumber })
            .getOne();

    }

}

