import { IsOptional, IsString } from "class-validator";

export class SaveUserAddrDTO {

    @IsString()
    receiver: string;
  
    @IsString()
    provinceId: string;
  
    @IsString()
    province: string;
  
    @IsString()
    city: string;

    @IsString()
    cityId: string;

    @IsString()
    area: string;
  
    @IsString()
    areaId: string;
  
    @IsOptional()
    postCode: string;
  
    @IsString()
    addr: string;

    @IsString()
    mobile: string;
    
  }
  