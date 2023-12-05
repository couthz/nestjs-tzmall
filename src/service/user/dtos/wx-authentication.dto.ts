import { IsNotEmpty } from "class-validator";

export class WxAuthenticationDTO {

    //客户端调用wx.login()生成的临时code
    @IsNotEmpty({ message: "code不能为空" })
    code: string;
}