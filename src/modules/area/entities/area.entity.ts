import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity("tz_area", { schema: "tz_shops" })
export class Area {
  @PrimaryGeneratedColumn({
    type: "bigint",
    name: "area_id",
    comment: "主键",
    unsigned: true,
  })
  areaId: string;

  @Column("varchar", { name: "area_name", comment: "区域名称", length: 50 })
  areaName: string;

  @Column(
    "bigint",
    {
    name: "parent_id",
    comment: "父级ID",
    unsigned: true,
  })
  parentId: string;

  @Column(
    "int",
    {
    name: "level",
    comment: "层级",
    unsigned: true,
  })
  level: number;
}
