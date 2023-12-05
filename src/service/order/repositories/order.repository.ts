
import { CustomRepository } from '@/common/database/decorators';
import { Order } from '../entities/order.entity';
import { BaseRepository } from '@/common/database/base';
import { SelectQueryBuilder } from 'typeorm';
import { OrderStatus } from '../enums/order.enum';
import { OrderItem } from '../entities';

@CustomRepository(Order)
export class OrderRepository extends BaseRepository<Order> {
    protected _qbName = "order";
    // Custom methods and queries can be added here

    buildBaseQB() {
        return this.createQueryBuilder('order');
    }

    async getOrderDetailByOrderNumber(orderNumber: string): Promise<Order> {
        return this.buildBaseQB()
            .leftJoinAndSelect('order.orderItems', 'orderItem')
            .leftJoinAndSelect('order.orderAddr', 'orderAddr')
            .where('order.order_number = :orderNumber', { orderNumber })
            .getOne();
    }

    //根据userId和status查询订单,并连接所有的orderItem
     getOrdersByUserIdAndStatus(status: OrderStatus, userId: string): SelectQueryBuilder<Order> {
          const queryBuilder = this.buildBaseQB()
          .where('order.user_id = :userId', { userId })

          if (status !== OrderStatus.ALL) {
            queryBuilder.andWhere('order.status = :status', { status })
          }
          queryBuilder.leftJoinAndMapMany('order.orderItems', OrderItem, 'orderItem', 'orderItem.order_id = order.order_id')
    
          return queryBuilder; 
    }
}
