import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity('tz_prod_comment', { comment: '商品评论' })
export class ProdComment {
  @PrimaryGeneratedColumn({
    type: 'bigint',
    name: 'prod_comm_id',
    comment: 'ID',
  })
  prodCommId: number;

  @Column('bigint', {
    name: 'prod_id',
    comment: '商品ID',
  })
  prodId: number;

  @Column('bigint', {
    name: 'order_item_id',
    nullable: true,
    comment: '订单项ID',
  })
  orderItemId: number | null;

  @Column('varchar', {
    name: 'user_id',
    nullable: true,
    comment: '评论用户ID',
    length: 36,
  })
  userId: string | null;

  @Column('varchar', {
    name: 'content',
    comment: '评论内容',
    length: 500,
    default: '',
  })
  content: string;

  @Column('varchar', {
    name: 'reply_content',
    comment: '掌柜回复',
    length: 500,
    default: '',
  })
  replyContent: string;

  @Column('timestamp', {
    name: 'rec_time',
    nullable: true,
    comment: '记录时间',
  })
  recTime: Date | null;

  @Column('timestamp', {
    name: 'reply_time',
    nullable: true,
    comment: '回复时间',
  })
  replyTime: Date | null;

  @Column('int', {
    name: 'reply_sts',
    comment: '是否回复 0:未回复  1:已回复',
    default: 0,
  })
  replySts: number;

  @Column('varchar', {
    name: 'postip',
    nullable: true,
    comment: 'IP来源',
    length: 16,
  })
  postip: string | null;

  @Column('tinyint', {
    name: 'score',
    comment: '得分，0-5分',
    default: 0,
  })
  score: number;

  @Column('int', {
    name: 'useful_counts',
    comment: '有用的计数',
    default: 0,
  })
  usefulCounts: number;

  @Column('varchar', {
    name: 'pics',
    nullable: true,
    comment: '晒图的json字符串',
    length: 1000,
  })
  pics: string | null;

  @Column('int', {
    name: 'is_anonymous',
    comment: '是否匿名(1:是  0:否)',
    default: 0,
  })
  isAnonymous: number;

  @Column('int', {
    name: 'status',
    nullable: true,
    comment: '是否显示，1:为显示，0:待审核， -1：不通过审核，不显示。 如果需要审核评论，则是0,，否则1',
  })
  status: number | null;

  @Column('tinyint', {
    name: 'evaluate',
    nullable: true,
    comment: '评价(0好评 1中评 2差评)',
  })
  evaluate: number | null;

  @Column('varchar', {
    name: 'nick_name',
    nullable: false,
    comment: '用户昵称',
  })
  nickName: string;

  @Column('varchar', {
    name: 'prod_attr_desc',
    nullable: false,
    comment: '商品属性描述',
  })
  prodAttrDesc: string;

  @Column('varchar', {
    name: 'avatar_url',
    nullable: false,
    comment: '用户头像',
  })
  avatarUrl: string;


}