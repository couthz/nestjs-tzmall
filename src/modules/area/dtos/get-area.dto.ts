import { IsDefined, IsString } from "class-validator";

export class GetAreaDTO {
    @IsString() 
    @IsDefined()
    provinceId: string;
    @IsString() 
    @IsDefined()
    cityId: string;
}