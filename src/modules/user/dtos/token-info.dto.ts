export class TokenInfoDTO {
    accessToken: string;

    //token多少秒过期
    //默认值为30天
    expiresIn: number;

    //用户昵称
    nickName: string;

    //用户头像
    avatarUrl: string;

    userMobile: string;


}