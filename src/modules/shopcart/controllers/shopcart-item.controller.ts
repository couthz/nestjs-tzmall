
import { Controller, Post, Delete, Body, Get } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { ShopcartItemService } from '@/modules/shopcart/services/shopcart-item.service';
import { ShopcartModule } from '../shopcart.module';
import { Depends } from '@/modules/restful/decorators';
import { ChangeShopcartDTO } from '@/modules/shopcart/dtos/change-shopcart.dto';
import { CurrentUserId } from '@/modules/core/decorators/current-user-id.decorator';
import { DeleteShopcartDTO } from '@/modules/shopcart/dtos/delete-shopcart.dto';
import { GetShopcartDTO } from '../dtos/get-shopcart.dto';
import { ChangeItemCheckedDTO } from '../dtos/change-item-checked.dto';

@ApiTags('购物车管理')
@Depends(ShopcartModule)
@Controller('shopcartItem')
export class ShopcartItemController {
  constructor(private shopcartItemService: ShopcartItemService) {}
  
  @Post("info")
  async getShopcartByUserId(@CurrentUserId() userId: string): Promise<GetShopcartDTO> {
    return await this.shopcartItemService.getShopcartItemsAndTotalPayByUserId(userId);
  }
  
  @Get("prodCount")
  getShopcartProdCount(@CurrentUserId() userId: string): Promise<number> {
    return this.shopcartItemService.getShopcartProdCount(userId);
  }

  @Post('updateSku')
  async updateSku(@Body() changeShopcartDTO: ChangeShopcartDTO, @CurrentUserId() userId: string): Promise<string>{
   return await this.shopcartItemService.updateSku(changeShopcartDTO,userId);
  }


  @Post('changeItem')
  async changeItem(@Body() changeShopcartDTO: ChangeShopcartDTO, @CurrentUserId() userId: string): Promise<string> {
    return await this.shopcartItemService.addOrUpdateShopcartItem(changeShopcartDTO,userId);
  }

  //删除购物车项
  @Delete('deleteItems')
  async deleteItems(@Body()deleteShopcartDTO: DeleteShopcartDTO, @CurrentUserId() userId: string): Promise<string> {
    return await this.shopcartItemService.deleteShopcartItemsByIds(deleteShopcartDTO.shopcartItemIds, userId);
  }

  @Post('changeItemChecked')
  async changeItemChecked(@Body()changeItemCheckedDTO:ChangeItemCheckedDTO, @CurrentUserId() userId: string): Promise<string>{
    return await this.shopcartItemService.changeItemChecked(changeItemCheckedDTO, userId);
  }
  
}
