export enum PayType {
    WECAHT = 1,
    ALIPAY = 2,
}

export enum PayedStatus {
    PAYED = 1,
    UNPAYED = 0,
}

export enum OrderStatus {

    //全部类型
    ALL = 0,

    //待付款
    UNPAY = 100,

    //已付款待发货
    PAYED = 101,

    //已发货待收货
    DELIVERED = 102,

    //已收货待评价
    RECEIVED = 103,

    //交易成功
    SUCCESS = 104,

    //交易关闭
    CLOSE = 200
}

export enum OrderCloseType {
    //订单活跃
    ACTIVE = 0,

    //超时未支付
	TIMEOUT = 1,

    //退款关闭
	REFUND = 2 ,

    //卖家关闭
	SELLERCLOSE = 3,

    //买家关闭
	BUYERCLOSE = 4,
}

export enum OrderItemCommentStatus {
    //未评价
    UNCOMMENT = 0,

    //已评价
    COMMENTED = 1,
}

export enum OrderDeliveryStatus {
    //未发货
    UNDELIVERED = 0,

    //已发货
    DELIVERED = 1,
}
