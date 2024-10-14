import { CommonStatus } from "@/modules/core/constants/enums";
import { IsBoolean, IsNotEmpty, IsString } from "class-validator";

export class UpdateSellerAddr {

    @IsString()
    sellerAddrId: string;
  
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

    @IsNotEmpty()
    status: CommonStatus;
        
    @IsBoolean()
    defaultConsignAddr: boolean;

    @IsBoolean()
    defaultReturnAddr: boolean;
    
  }
  