import { BuynowSkuDTO } from './buynow-sku.dto';
import { GetCheckOutDTO } from './get-checkout.dto';

//点击立即购买后请求结算页的参数
export class BuynowGetCheckOutDTO extends GetCheckOutDTO {
    // Add additional properties or methods here
    buynowSkuDTO: BuynowSkuDTO;
}
