import { CustomRepository } from '@/common/database/decorators';
import { OrderItem } from '../entities/order-item.entity';
import { BaseRepository } from '@/common/database/base';

@CustomRepository(OrderItem)
export class OrderItemRepository extends BaseRepository<OrderItem> {
    protected _qbName = "orderItem";
    // Custom methods and queries can be added here
}
