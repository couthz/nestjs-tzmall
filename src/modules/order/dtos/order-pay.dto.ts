import { IsString } from 'class-validator';
export class OrderPayDTO {

    @IsString()
    orderNumber: string;
}