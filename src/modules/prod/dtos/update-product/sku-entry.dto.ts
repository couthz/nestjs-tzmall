import { IsString } from "class-validator";

export class SkuEntryDTO {
  @IsString()
  joinAttrValueName: string;
  @IsString()
  stock: string;
  @IsString()
  price: string
}