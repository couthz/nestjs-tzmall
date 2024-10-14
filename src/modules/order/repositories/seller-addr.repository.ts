import { CustomRepository } from "@/modules/database/decorators";
import { SellerAddr } from "../entities/seller-addr.entity";
import { BaseRepository } from "@/modules/database/base";
import { UpdateSellerAddr } from "../dtos/update-seller-addr.dto";

@CustomRepository(SellerAddr)
export class SellerAddrRepository extends BaseRepository<SellerAddr> {

    
    protected _qbName = "sellerAddr";
    // Custom methods and queries can be added here
    buildBaseQB() {
        return this.createQueryBuilder('sellerAddr');
    }

    listSellerAddr() {
        //查询出所有status为1的记录
        return this.buildBaseQB()
            .where('sellerAddr.status = :status', { status: 1 })
            .getMany();
    }

    updateBy(sellerAddr: UpdateSellerAddr) {
        //根据sellerAddr更新记录,sellerAddr和实体类SellerAddr的字段类似，只是缺少一些字段
        return this.buildBaseQB()
            .update()
            .set(sellerAddr)
            .where('seller_addr_id = :sellerAddrId', { sellerAddrId: sellerAddr.sellerAddrId })
            .execute();
    } 
    
    updateDefaultConsignAddr(sellerAddrId: string) {
        return this.buildBaseQB()
            .update()
            .set({ defaultConsignAddr: false })
            .execute()
            .then(() => {
                return this.buildBaseQB()
                    .update()
                    .set({ defaultConsignAddr: true })
                    .where('seller_addr_id = :sellerAddrId', { sellerAddrId })
                    .execute();
            });
    }

    updateDefaultReturnAddr(sellerAddrId: string) {
        return this.buildBaseQB()
            .update()
            .set({ defaultReturnAddr: false })
            .execute()
            .then(() => {
                return this.buildBaseQB()
                    .update()
                    .set({ defaultReturnAddr: true })
                    .where('seller_addr_id = :sellerAddrId', { sellerAddrId })
                    .execute();
            });
    }

}
