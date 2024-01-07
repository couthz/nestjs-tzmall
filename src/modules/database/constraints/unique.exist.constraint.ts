import { Injectable } from '@nestjs/common';
import {
    ValidationArguments,
    ValidationOptions,
    ValidatorConstraint,
    ValidatorConstraintInterface,
    registerDecorator,
} from 'class-validator';
import { isNil, merge } from 'lodash';
import { DataSource, Not, ObjectType } from 'typeorm';

type Condition = {
    entity: ObjectType<any>;
    /**
     * 默认忽略字段为id
     */
    ignore?: string;
    /**
     * 忽略的字段在DTO类中的属性，默认与ignore相同，用于处理忽略字段在DTO中取值时的属性名与数据库中的字段名不同的特殊情况
     */
    ignoreKey?: string;
    /**
     * 如果没有指定字段则使用当前验证的属性作为查询依据
     */
    property?: string;
};

/**
 * 在更新时验证唯一性,通过指定ignore忽略忽略的字段
 */
@ValidatorConstraint({ name: 'dataUniqueExist', async: true })
@Injectable()
export class UniqueExistContraint implements ValidatorConstraintInterface {
    constructor(private dataSource: DataSource) {}

    async validate(value: any, args: ValidationArguments) {
        const config: Omit<Condition, 'entity'> = {
            ignore: 'id',
            property: args.property,
        };
        const condition = ('entity' in args.constraints[0]
            ? merge(config, args.constraints[0])
            : {
                  ...config,
                  entity: args.constraints[0],
              }) as unknown as Required<Condition>;
        if (!condition.entity) return false;
        // 在传入的dto数据中获取需要忽略的字段的值
        const ignoreValue = (args.object as any)[
            isNil(condition.ignoreKey) ? condition.ignore : condition.ignoreKey
        ];
        // 如果忽略字段不存在则验证失败
        if (ignoreValue === undefined) return false;
        // 通过entity获取repository
        const repo = this.dataSource.getRepository(condition.entity);
        // 查询忽略字段之外的数据是否对queryProperty的值唯一
        return isNil(
            await repo.findOne({
                where: {
                    [condition.property]: value,
                    [condition.ignore]: Not(ignoreValue),
                },
                withDeleted: true,
            }),
        );
    }

    defaultMessage(args: ValidationArguments) {
        const { entity, property } = args.constraints[0];
        const queryProperty = property ?? args.property;
        if (!(args.object as any).getManager) {
            return 'getManager function not been found!';
        }
        if (!entity) {
            return 'Model not been specified!';
        }
        return `${queryProperty} of ${entity.name} must been unique!`;
    }
}

/**
 * 更新数据时的唯一性验证
 * @param params Entity类或验证条件对象
 * @param validationOptions
 */
export function IsUniqueExist(
    params: ObjectType<any> | Condition,
    validationOptions?: ValidationOptions,
) {
    return (object: Record<string, any>, propertyName: string) => {
        registerDecorator({
            target: object.constructor,
            propertyName,
            options: validationOptions,
            constraints: [params],
            validator: UniqueExistContraint,
        });
    };
}
