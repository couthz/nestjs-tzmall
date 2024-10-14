import { Depends } from "@/modules/restful/decorators";
import { Controller, Get, Param} from "@nestjs/common";
import { ApiTags } from "@nestjs/swagger";
import { AreaModule } from "../area.module";
import { AreaService } from "../services";
import { Area } from "../entities";

@ApiTags('省市区管理')
@Depends(AreaModule)
@Controller('area')
export class AreaController {
  constructor(private areaService: AreaService) {}
  
  @Get("listByParentId/:parentId")
  async listByParentId(@Param("parentId") parentId: string): Promise<Area[]> {
    return this.areaService.listByParentId(parentId);
  }
  
}