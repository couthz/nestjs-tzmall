import { IsString } from 'class-validator';
export class OrderSubmmitDTO {

    @IsString()
    remarks: string;
}