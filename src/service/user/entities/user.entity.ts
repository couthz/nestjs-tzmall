import { Column, CreateDateColumn, Entity, Index, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";

@Index("ud_user_mail", ["userMail"], { unique: true })
@Index("ud_user_unique_mobile", ["userMobile"], { unique: true })
@Index("ud_user_union_id", ["unionId"], { unique: true })
@Entity("tz_user", { schema: "tz_shops" })
export class User {
  @PrimaryGeneratedColumn({ type: "bigint", name: "user_id", comment: "ID" })
  userId: string;

  @Column("varchar", {
    name: "nick_name",
    nullable: true,
    comment: "用户昵称",
    length: 50,
  })
  nickName: string | null;

  @Column("varchar", {
    name: "real_name",
    nullable: true,
    comment: "真实姓名",
    length: 50,
  })
  realName: string | null;

  @Column("varchar", {
    name: "user_mail",
    nullable: true,
    unique: true,
    comment: "用户邮箱",
    length: 100,
  })
  userMail: string | null;

  @Column("varchar", {
    name: "login_password",
    nullable: true,
    comment: "登录密码",
    length: 255,
  })
  loginPassword: string | null;

  @Column("varchar", {
    name: "pay_password",
    nullable: true,
    comment: "支付密码",
    length: 50,
  })
  payPassword: string | null;

  @Column("varchar", {
    name: "user_mobile",
    nullable: true,
    unique: true,
    comment: "手机号码",
    length: 50,
  })
  userMobile: string | null;

  @UpdateDateColumn({ name: "modify_time", comment: "修改时间" })
  modifyTime: Date;

  @CreateDateColumn({ name: "user_regtime", comment: "注册时间" })
  userRegtime: Date;

  @Column("varchar", {
    name: "user_regip",
    nullable: true,
    comment: "注册IP",
    length: 50,
  })
  userRegip: string | null;

  @Column("datetime", {
    name: "user_lasttime",
    nullable: true,
    comment: "最后登录时间",
  })
  userLasttime: Date | null;

  @Column("varchar", {
    name: "user_lastip",
    nullable: true,
    comment: "最后登录IP",
    length: 50,
  })
  userLastip: string | null;

  @Column("varchar", {
    name: "user_memo",
    nullable: true,
    comment: "备注",
    length: 500,
  })
  userMemo: string | null;

  @Column("char", {
    name: "sex",
    nullable: true,
    comment: "M(男) or F(女)",
    length: 1,
    default: () => "'M'",
  })
  sex: string | null;

  @Column("char", {
    name: "birth_date",
    nullable: true,
    comment: "例如：2009-11-27",
    length: 10,
  })
  birthDate: string | null;

  @Column("varchar", {
    name: "pic",
    nullable: true,
    comment: "头像图片路径",
    length: 255,
  })
  pic: string | null;

  @Column("int", {
    name: "status",
    comment: "状态 1 正常 0 无效",
    default: () => "'1'",
  })
  status: number;

  @Column("int", { name: "score", nullable: true, comment: "用户积分" })
  score: number | null;

  @Column("varchar", { name: "open_id", nullable: true, length: 255 })
  openId: string | null;

  @Column("varchar", {
    name: "union_id",
    nullable: true,
    unique: true,
    length: 255,
  })
  unionId: string | null;

  @Column("varchar", {
    name: "user_wechat",
    nullable: true,
    comment: "用户微信号",
    length: 255,
  })
  userWechat: string | null;
}
