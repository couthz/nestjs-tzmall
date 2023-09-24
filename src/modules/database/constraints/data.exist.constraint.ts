import { Injectable } from '@nestjs/common';
import {
    ValidationArguments,
    ValidationOptions,
    ValidatorConstraint,
    ValidatorConstraintInterface,
    registerDecorator,
} from 'class-validator';
import { DataSource, ObjectType, Repository } from 'typeorm';

type Condition = {
    entity: ObjectType<any>;
    /**
     * 用于查询的比对字段,默认id
     */
    map?: string;
};
/**
 * 查询某个字段的值是否在数据表中存在
 */
@ValidatorConstraint({ name: 'dataExist', async: true })
@Injectable()
export class DataExistConstraint implements ValidatorConstraintInterface {
    constructor(private dataSource: DataSource) {}

    async validate(value: string, args: ValidationArguments) {
        let repo: Repository<any>;
        if (!value) return true;
        // 默认对比字段是id
        let map = 'id';
        // 通过传入的entity获取其repository
        if ('entity' in args.constraints[0]) {
            map = args.constraints[0].map ?? 'id';
            repo = this.dataSource.getRepository(args.constraints[0].entity);
        } else {
            repo = this.dataSource.getRepository(args.constraints[0]);
        }
        // 通过查询记录是否存在进行验证
        const item = await repo.findOne({ where: { [map]: value } });
        return !!item;
    }

    defaultMessage(args: ValidationArguments) {
        if (!args.constraints[0]) {
            return 'Model not been specified!';
        }
        return `All instance of ${args.constraints[0].name} must been exists in databse!`;
    }
}

/**
 * 模型存在性验证
 * @param entity
 * @param validationOptions
 */
function IsDataExist(
    entity: ObjectType<any>,
    validationOptions?: ValidationOptions,
): (object: Record<string, any>, propertyName: string) => void;

/**
 *  模型存在性验证
 * @param condition
 * @param validationOptions
 */
function IsDataExist(
    condition: Condition,
    validationOptions?: ValidationOptions,
): (object: Record<string, any>, propertyName: string) => void;

/**
 * 模型存在性验证
 * @param condition
 * @param validationOptions
 */
function IsDataExist(
    condition: ObjectType<any> | Condition,
    validationOptions?: ValidationOptions,
): (object: Record<string, any>, propertyName: string) => void {
    return (object: Record<string, any>, propertyName: string) => {
        registerDecorator({
            target: object.constructor,
            propertyName,
            options: validationOptions,
            constraints: [condition],
            validator: DataExistConstraint,
        });
    };
}

export { IsDataExist };
