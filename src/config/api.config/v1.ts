import { Configure } from '@/common/config/configure';
import * as prodControllers from '@/modules/api/prod/controllers';
import * as userControllers from '@/modules/api/user/controllers';
import * as shopCartControllers from '@/modules/api/shopcart/controllers';
import * as orderControllers from '@/modules/api/order/controllers';

import { VersionOption } from '@/common/restful/types';

export const v1 = async (configure: Configure): Promise<VersionOption> => ({
    routes: [
        {
            name: 'app',
            path: '/',
            controllers: [],
            doc: {
                title: '应用接口',
                description: '前端APP应用接口',
                tags: [
                    { name: '商品标签操作', description: '对商品标签的增删查操作' },
                    { name: '商品分类操作', description: '对商品分类的增删查操作' },
                    { name: '商品操作', description: '对商品的增删查操作' },
                    { name: '用户认证操作', description: '对用户认证的增删查操作' },
                    { name: '购物车操作', description: '对购物车的增删查操作' },
                    { name: '订单操作', description: '对订单的增删查操作' },
                    { name: '支付操作', description: '对支付的增删查操作' },

                ],
            },
            children: [
                {
                    name: 'prod',
                    path: 'prod',
                    controllers: Object.values(prodControllers),
                },
                {
                    name: 'user',
                    path: 'user',
                    controllers: Object.values(userControllers),
                },
                {
                    name: 'shopcart',
                    path: 'shopcart',
                    controllers: Object.values(shopCartControllers),
                },
                {
                    name: 'order',
                    path: 'order',
                    controllers: Object.values(orderControllers),
                },
            ],
        },
    ],
});
