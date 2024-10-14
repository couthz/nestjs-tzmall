import { IsNumber, IsString } from "class-validator";


export class UpdateProdStatusDTO {
    @IsString()
    prodId: string;

    @IsNumber()
    status: number;
}