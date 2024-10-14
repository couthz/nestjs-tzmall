import { CustomRepository } from "@/modules/database/decorators";
import { UserAddr } from "../entities";
import { BaseRepository } from "@/modules/database/base";
import { UpdateUserAddrDTO } from "../dtos/update-user-addr.dto";

@CustomRepository(UserAddr)
export class UserAddrRepository extends BaseRepository<UserAddr> {
   
    
    protected _qbName = "userAddr";
    // Custom methods and queries can be added here
    buildBaseQB() {
        return this.createQueryBuilder('userAddr');
    }

    async findDefaultAddrByUserId(userId: string): Promise<UserAddr> {
        return this.buildBaseQB()
            .where('userAddr.user_id = :userId', { userId })
            .andWhere('userAddr.common_addr = 1')
            .getOne();
    }

    async listUserAddrByUserId(userId: string): Promise<UserAddr[]>{
        return this.buildBaseQB()
            .where('userAddr.user_id = :userId', { userId })
            .getMany();
    }

    updateUserAddr(updateUserAddrDTO: UpdateUserAddrDTO) {
        //根据updateUserAddrDTO.addrId更新对应的地址信息
        return this.buildBaseQB()
            .update()
            .set(updateUserAddrDTO)
            .where('addr_id = :addrId', { addrId: updateUserAddrDTO.addrId })
            .execute();
    }

    async deleteUserAddr(addrId: string) {
        //根据addrId查找记录
        const userAddr = await this.buildBaseQB()
            .where('addr_id = :addrId', { addrId })
            .getOne();
        //删除userAddr这条记录
        await this.remove(userAddr);

        if (userAddr.commonAddr == 1) {
            const newUserAddr = await this.buildBaseQB()
                .where('user_id = :userId', { userId: userAddr.userId })
                .getOne();
            newUserAddr.commonAddr = 1;
            this.save(newUserAddr);
        }
        
    }

    async changeDefaultAddr(addrId: string, userId: string) {
        //将userId用户原来的默认地址设置为非默认,并将addrId对应的记录设置为默认地址
        await this.buildBaseQB()
            .update()
            .set({ commonAddr: 0 })
            .where('user_id = :userId', { userId })
            .execute();
        this.buildBaseQB().update()
            .set({ commonAddr: 1 })
            .where('addr_id = :addrId', { addrId })
            .execute();

    }
}
