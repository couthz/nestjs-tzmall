import { CustomRepository } from "@/modules/database/decorators";
import { BaseRepository } from "@/modules/database/base";
import { Area } from "../entities";
import { GetAreaDTO } from "../dtos/get-area.dto";

@CustomRepository(Area)
export class AreaRepository extends BaseRepository<Area> {
    
    
    protected _qbName = 'area';

    buildBaseQB() {
        return this.createQueryBuilder('area');
    }

    async listByParentId(parentId: string): Promise<Area[]> {
        return this.buildBaseQB()
            .where('area.parentId = :parentId', { parentId })
            .getMany();
    }

    async listByIds(getAreaDTO: GetAreaDTO): Promise<Area[][]> {
        const areaList: Area[][] = [];
        
        areaList[0] = await this.listByParentId("0")
        areaList[1] = await this.listByParentId(getAreaDTO.provinceId);
        areaList[2] = await this.listByParentId(getAreaDTO.cityId);
        return areaList;
    }
    



}