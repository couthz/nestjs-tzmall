import { CustomRepository } from "@/common/database/decorators";
import { OrderAddr } from "../entities";
import { BaseRepository } from "@/common/database/base";

@CustomRepository(OrderAddr)
export class OrderAddrRepository extends BaseRepository<OrderAddr> {
    protected _qbName = "orderAddr";
    // Custom methods and queries can be added here
}
