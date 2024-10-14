import { IsString } from "class-validator";

export class OrderAddrDTO {
    @IsString()
    orderAddrId: string;
    
    @IsString()
    addrId: string;
    @IsString()   
    userId: string;
    @IsString()
    receiver: string | null;
    @IsString()
    provinceId: string | null;
    @IsString()
    province: string | null;
    @IsString()
    areaId: string | null;
    @IsString()
    area: string | null;
    @IsString()
    cityId: string | null;
    @IsString()
    city: string | null;
    @IsString()
    addr: string | null;
    @IsString()
    postCode: string | null;
    @IsString()
    mobile: string | null;
}