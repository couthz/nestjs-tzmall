import { BaseService } from "@/modules/database/base";
import { Injectable } from "@nestjs/common";
import { UserAddr } from "../entities";
import { UserAddrRepository } from "../repositories";
import { UpdateUserAddrDTO } from "../dtos/update-user-addr.dto";
import { SaveUserAddrDTO } from "../dtos/save-user-addr.dto";

@Injectable()
export class UserAddrService extends BaseService<UserAddr, UserAddrRepository>{
    

   
    
    constructor(
        protected repository: UserAddrRepository
    ) {
        super(repository);
    }

    async listUserAddr(userId: string): Promise<UserAddr[]> {
        return this.repository.listUserAddrByUserId(userId);
    }

    async deleteUserAddr(addrId: string) {
        return await this.repository.deleteUserAddr(addrId);

    }

    async updateUserAddr(updateUserAddrDTO: UpdateUserAddrDTO) {
        return await this.repository.updateUserAddr(updateUserAddrDTO);
    }

    async saveUserAddr(saveUserAddrDTO: SaveUserAddrDTO, userId: string) {
        //使用this.repository.create,创建一个新的UserAddr实例,但是传入的参数要去掉addrId
        //利用repository检查,如果表中没有userId对应的记录,则将commonAddr设置为1,否则设置为0
        const userAddr = this.repository.create(saveUserAddrDTO);
        userAddr.userId = userId;
        userAddr.status = 1;
        const defaultAddr = await this.repository.findDefaultAddrByUserId(userId);
        if (defaultAddr == null) {
            userAddr.commonAddr = 1;
        } else {
            userAddr.commonAddr = 0;
        }
        return this.repository.save(userAddr);
    }

    changeDefaultAddr(addrId: string, userId: string) {
        //将userId用户原来的默认地址设置为非默认,并将addrId对应的记录设置为默认地址
        return this.repository.changeDefaultAddr(addrId, userId);
    }
}