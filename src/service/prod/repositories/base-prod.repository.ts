import { BaseRepository } from '@/common/database/base';


export abstract class BaseProdRepository<E> extends BaseRepository<E> {

    protected prodDesc = ['prod.prod_id', 'prod.prod_name', 'prod.ori_price', 'prod.price', 'prod.cost_price', 'prod.pic', 'prod.category_id', 'prod.sold_num', 'prod.total_stocks'];
}
