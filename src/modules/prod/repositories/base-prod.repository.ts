import { BaseRepository } from "@/modules/database/base";


export abstract class BaseProdRepository<E> extends BaseRepository<E> {

    protected prodDesc = ['prod.prodId', 'prod.prodName', 'prod.oriPrice', 'prod.price', 'prod.costPrice', 'prod.pic', 'prod.categoryId', 'prod.soldNum', 'prod.totalStocks'];
}
