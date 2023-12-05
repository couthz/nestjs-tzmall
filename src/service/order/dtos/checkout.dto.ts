import { UserAddr } from './../../user/entities/user-addr.entity';
import { CheckOutSkuDTO } from "./checkout-sku.dto"

//结算页信息
export class CheckOutDTO {
    totalPay: string; //商品总金额
    totalCount: number; //商品总数量

    checkOutSkuDTOs: CheckOutSkuDTO[]; //商品信息

    buyerRemark: string; //买家备注
    userAddr: UserAddr;
    //TODO 运费
    transfee: string; 


    //TODO 优惠券
}