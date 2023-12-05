export class TokenInfoDTO {
    accessToken: string;

    //token多少秒过期
    //默认值为30天
    expiresIn: number;
}