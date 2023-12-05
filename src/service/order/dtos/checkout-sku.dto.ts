//结算页信息中的商品信息
export class CheckOutSkuDTO {
    shopcartItemId: string;

    prodId: string;

    skuId: string;

    prodName: string;

    itemCount: number;

    skuName: string;

    pic: string;

    //商品单价
    price: string;

    //商品总价
    totalPay: string;

    addShopcartDate: Date;

}