import { BaseService } from "@/common/database/base";
import { ProdCategory } from "../entities";
import { ProdCategoryRepository } from "../repositories";
import { Injectable } from "@nestjs/common";

@Injectable()
export class ProdCategoryService extends BaseService<ProdCategory, ProdCategoryRepository> {
    constructor(protected repository: ProdCategoryRepository) {
        super(repository);
    }

    async listCategoryProd(): Promise<ProdCategory[]> {
        return this.repository.listCategoryProd();
    }

    async listCategory(): Promise<ProdCategory[]> {
        return this.repository.listCategory();
    }
}