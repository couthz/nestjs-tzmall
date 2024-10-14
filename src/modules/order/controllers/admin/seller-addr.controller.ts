import { Depends } from "@/modules/restful/decorators";
import { Body, Controller, Get, Param, Post } from "@nestjs/common";
import { ApiTags } from "@nestjs/swagger";
import { OrderModule } from "../../order.module";
import { SellerAddr } from "../../entities/seller-addr.entity";
import { SellerAddrService } from "../../services/seller-addr.service";
import { UpdateSellerAddr } from "../../dtos/update-seller-addr.dto";

@ApiTags('卖家地址管理')
@Depends(OrderModule)
@Controller('sellerAddr')
export class SellerAddrController {
    constructor(protected service: SellerAddrService) {}

    @Get("list")
    async orderPage(): Promise<SellerAddr[]> {
        const sellerAddrList =  await this.service.listSellerAddr();
        return sellerAddrList;
    }

    @Post("update")
    update(@Body() updateSellerAddr: UpdateSellerAddr) {
        this.service.updateBy(updateSellerAddr);
    }

    @Post("updateDefaultConsignAddr/:sellerAddrId")
    updateDefaultConsignAddr(@Param("sellerAddrId") sellerAddrId: string) {
        this.service.updateDefaultConsignAddr(sellerAddrId);
    }

    @Post("updateDefaultReturnAddr/:sellerAddrId")
    updateDefaultReturnAddr(@Param("sellerAddrId") sellerAddrId: string) {
        this.service.updateDefaultReturnAddr(sellerAddrId);
    }

}

