import { CustomRepository } from "@/common/database/decorators";
import { Prod } from "../entities";
import { BaseProdRepository } from "./base-prod.repository";

@CustomRepository(Prod)
export class ProdRepository extends BaseProdRepository<Prod> {
    protected _qbName = 'prod';

    buildBaseQB() {
        return this.createQueryBuilder('prod');
    }

    async getProdInfoById(id: string): Promise<Prod> {
        return this.buildBaseQB()
            .where('prod.prod_id = :id', { id })
            .getOne();
    }

}