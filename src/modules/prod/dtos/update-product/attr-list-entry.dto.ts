import { IsBoolean, IsString } from "class-validator";
import { AttrValueFieldEntryDTO } from "./attr-value-field-entry.dto";

export class AttrListEntryDTO {

    @IsString()
    attrId: string;
    @IsString()
    attrName: string;
    @IsBoolean()
    mainAttr: boolean;

    attrValueFieldList: AttrValueFieldEntryDTO[]

}