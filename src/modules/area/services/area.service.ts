import { BaseService } from "@/modules/database/base";
import { Area } from "../entities";
import { AreaRepository } from "../repositories";
import { Injectable } from "@nestjs/common";
import { GetAreaDTO } from "../dtos/get-area.dto";

@Injectable()
export class AreaService extends BaseService<Area, AreaRepository>{
    
    
    constructor(protected repository: AreaRepository) {
        super(repository);
    }

    async listByParentId(parentId: string): Promise<Area[]> {
        return this.repository.listByParentId(parentId);
    }

    async listByIds(getAreaDTO: GetAreaDTO): Promise<Area[][]> {
       return this.repository.listByIds(getAreaDTO);
    }

}
