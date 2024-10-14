import { BaseRepository } from "@/modules/database/base";
import { OrderAddr } from "../entities";
import { CustomRepository } from "@/modules/database/decorators";
import { OrderAddrDTO } from "../dtos/order-addr.dto";

@CustomRepository(OrderAddr)
export class OrderAddrRepository extends BaseRepository<OrderAddr> {

    protected _qbName = "orderAddr";
    // Custom methods and queries can be added here
    updateBy(orderAddrDTO: OrderAddrDTO) {
        return this.createQueryBuilder(this._qbName)
            .update()
            .set(orderAddrDTO)
            .where("orderAddrId = :orderAddrId", { orderAddrId: orderAddrDTO.orderAddrId })
            .execute();
    }
}
