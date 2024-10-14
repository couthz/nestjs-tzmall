import { IsObject, IsOptional, IsString } from "class-validator";

export class PayNotifyDTO {

    /**
     * 应用AppID
     */
    @IsString()
    appid:string;

    /**
     * 商户号
     */
    @IsString()
    mchid: string;

    /**
     * 商户订单号
     */
    @IsString()
    out_trade_no: string;

     /**
     * 微信支付订单号
     */
     @IsString()
    transaction_id: string;

    /**
     * 交易类型, 枚举值
     */
    @IsString()
    trade_type: string;

    /**
     * 交易状态 枚举值
     */
    @IsString()
    trade_state: string;

    /**
     * 交易状态描述
     */
    @IsString()
    trade_state_desc: string;

    /**
     * 银行类型
     */
    @IsString()
    bank_type: string;

    /**
     * 附加数据 string
     */
    @IsOptional()
    attach: string;

    /**
     * 支付完成时间
     */
    @IsString()
    success_time: string;

    /**
     * 支付者信息
     */
    @IsObject()
    payer: {
        openid: string;
    };

    /**
     * 金额
     */
    @IsObject()
    amount: {
        //订单总金额,单位为分
        total: number;
        //用户支付金额,单位为分
        payer_total: number;
        currency: string;
        payer_currency: string;
    };

    //支付场景信息
    @IsOptional()
    scene_info: {
        //终端设备号
        device_id: string;
    };

    /**
     * 优惠功能
     */
    @IsOptional()
    promotion_detail: {
        coupon_id: string;
        name: string;
        scope: string;
        type: string;
        amount: number;
        stock_id: string;
        wechatpay_contribute: number;
        merchant_contribute: number;
        other_contribute: number;
        currency: string;
        goods_detail: {
            goods_id: string;
            quantity: number;
            unit_price: number;
            discount_amount: number;
            goods_remark: string;
        }[];
    }[];
 
}