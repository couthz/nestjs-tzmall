
import { Body, Controller,Get, Param, Post } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { AreaModule } from '../../area.module';
import { Depends } from '@/modules/restful/decorators';
import { AreaService } from '../../services';
import { Area } from '../../entities';
import { GetAreaDTO } from '../../dtos/get-area.dto';

@ApiTags('省市区管理')
@Depends(AreaModule)
@Controller('area')
export class AreaController {
  constructor(private areaService: AreaService) {}
  
  @Get("listByParentId/:parentId")
  async listByParentId(@Param("parentId") parentId: string): Promise<Area[]> {
    return this.areaService.listByParentId(parentId);
  }

  @Post("listByIds")
  async listByIds(@Body() getAreaDTO: GetAreaDTO): Promise<Area[][]> {
    return this.areaService.listByIds(getAreaDTO);
  }
  
}
