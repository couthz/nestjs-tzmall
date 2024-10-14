import { CustomRepository } from '@/modules/database/decorators';
import { OrderItem } from '../entities/order-item.entity';
import { BaseRepository } from '@/modules/database/base';

@CustomRepository(OrderItem)
export class OrderItemRepository extends BaseRepository<OrderItem> {

    protected _qbName = "orderItem";
    // Custom methods and queries can be added here
    buildBaseQB() {
        return this.createQueryBuilder('orderItem');
    }
    async sendout(orderId: string, selectedOrderItems: string[], deliveryIds: string[]) {
        //根据selectedOrderItems中的主键更新记录,将dvy_flow_numbers字段更新为flowNumbers拼接后的值,并将delivery_status改为1
        //然后根据order_id检查所有的订单项是否都已经发货,如果是,则返回true,否则返回false
        const deliveryIdsStr = deliveryIds.join(',');
        await this.buildBaseQB()
            .update()
            .set({ deliveryIds: deliveryIdsStr, deliveryStatus: 1 })
            .where('order_item_id in (:...orderItems)', { orderItems: selectedOrderItems })
            .execute();
        const orderItems = await this. buildBaseQB()
            .where('order_id = :orderId', { orderId })
            .getMany();
        const deliveryResult = orderItems.every(orderItem => orderItem.deliveryStatus === 1);
        return deliveryResult;
    }

    async findOrderItemsByOrderNumber(orderNumber: string) {
        return this.buildBaseQB()
            .where('order_number = :orderNumber', { orderNumber })
            .getMany();
    }
}
