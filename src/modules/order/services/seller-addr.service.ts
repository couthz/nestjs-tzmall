import { BaseService } from "@/modules/database/base";
import { SellerAddr } from "../entities/seller-addr.entity";
import { SellerAddrRepository } from "../repositories/seller-addr.repository";
import { Injectable } from "@nestjs/common";
import { UpdateSellerAddr } from "../dtos/update-seller-addr.dto";

@Injectable()
export class SellerAddrService extends BaseService<SellerAddr, SellerAddrRepository>{
    updateDefaultConsignAddr(sellerAddrId: string) {
        this.repository.updateDefaultConsignAddr(sellerAddrId);
    }

    updateDefaultReturnAddr(sellerAddrId: string) {
        this.repository.updateDefaultReturnAddr(sellerAddrId);
    }

    updateBy(sellerAddr: UpdateSellerAddr) {
        this.repository.updateBy(sellerAddr);
    }

    constructor(
        protected repository: SellerAddrRepository
    ) {
        super(repository);
    }

    async listSellerAddr(): Promise<SellerAddr[]> {
        const sellerAddrList = await this.repository.listSellerAddr();
        return sellerAddrList;
    }

}