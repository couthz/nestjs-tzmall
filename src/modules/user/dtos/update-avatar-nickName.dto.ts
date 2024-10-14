import { IsString } from "class-validator";

export class UpdateAvatarNickNameDTO {
    @IsString()
    avatarUrl: string;
    @IsString()

    nickName: string;
}