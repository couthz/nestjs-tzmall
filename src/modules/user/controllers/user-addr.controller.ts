import { Depends } from "@/modules/restful/decorators";
import { Body, Controller, Delete, Get, Param, Post, Put } from "@nestjs/common";
import { ApiTags } from "@nestjs/swagger";
import { UserModule } from "../user.module";
import { UserAddrService } from "../services/user-addr.service";
import { UserAddr } from "../entities";
import { CurrentUserId } from "@/modules/core/decorators/current-user-id.decorator";
import { UpdateUserAddrDTO } from "../dtos/update-user-addr.dto";
import { SaveUserAddrDTO } from "../dtos/save-user-addr.dto";

@ApiTags('用户地址管理')
@Depends(UserModule)
@Controller('userAddr')
export class UserAddrController {

    constructor(protected service: UserAddrService) {}

    @Get('list')
    async listUserAddr(@CurrentUserId() userId: string): Promise<UserAddr[]> {
        return this.service.listUserAddr(userId);
    }

    @Put('update')
    updateUserAddr(@Body() updateUserAddrDTO: UpdateUserAddrDTO) {
        this.service.updateUserAddr(updateUserAddrDTO);
    }

    @Delete('delete/:addrId')
    deleteUserAddr(@Param("addrId") addrId: string) {
        this.service.deleteUserAddr(addrId);
    }

    @Post('save')
    saveUserAddr(@Body() saveUserAddrDTO: SaveUserAddrDTO, @CurrentUserId() userId: string){
        this.service.saveUserAddr(saveUserAddrDTO, userId);
    }

    @Put('defaultAddr/:addrId')
    changeDefaultAddr(@Param("addrId") addrId: string, @CurrentUserId() userId: string){
        console.log(addrId);
        this.service.changeDefaultAddr(addrId, userId);
    }

}