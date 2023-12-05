
import { Controller, Post, Delete, Body } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { ShopcartItemService } from '@/service/shopcart/services/shopcart-item.service';
import { ShopcartModule } from '../shopcart.module';
import { Depends } from '@/common/restful/decorators';
import { ChangeShopcartDTO } from '@/service/shopcart/dtos/change-shopcart.dto';
import { ShopcartAmountDTO } from '@/service/shopcart/dtos/shopcart-amount.dto';
import { CurrentUserId } from '@/common/core/decorators/current-user-id.decorator';
import { ShopcartItem } from '@/service/shopcart/entities';
import { TotalPayDTO } from '@/service/shopcart/dtos/total-pay.dto';
import { DeleteShopcartDTO } from '@/service/shopcart/dtos/delete-shopcart.dto';

@ApiTags('购物车操作')
@Depends(ShopcartModule)
@Controller('shopcartItem')
export class ShopcartItemController {
  constructor(private shopcartItemService: ShopcartItemService) {}
  
  @Post("info")
  async getShopcartByUserId(@CurrentUserId() userId: string): Promise<ShopcartItem[]> {
    return await this.shopcartItemService.getShopcartItemsAndProdsByUserId(userId);
  }


  @Post('changeItem')
  async changeItem(@Body() changeShopcartDTO: ChangeShopcartDTO, @CurrentUserId() userId: string) {
    await this.shopcartItemService.addOrUpdateShopcartItem(changeShopcartDTO,userId);
  }

  @Post('totalPay')
  async totalPay(@Body()totalPayDTO: TotalPayDTO): Promise<ShopcartAmountDTO> {
    return await this.shopcartItemService.getShopcartTotalPay(totalPayDTO.shopcartItemIds);
  }

  //删除购物车项
  @Delete('deleteItems')
  async deleteItems(@Body()deleteShopcartDTO: DeleteShopcartDTO) {
    await this.shopcartItemService.deleteShopcartItemsByIds(deleteShopcartDTO.shopcartItemIds);
  }
  
}
