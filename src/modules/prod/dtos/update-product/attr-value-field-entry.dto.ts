import { IsString } from "class-validator";

export class AttrValueFieldEntryDTO {

    @IsString()
    attrValueId: string;

    @IsString()
    attrValue: string;

    @IsString()
    imgUrl: string;
}