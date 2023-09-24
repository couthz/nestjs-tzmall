import { Injectable } from '@nestjs/common';
import {
    ValidationArguments,
    ValidationOptions,
    ValidatorConstraint,
    ValidatorConstraintInterface,
    registerDecorator,
} from 'class-validator';
import { isNil, merge } from 'lodash';
import { DataSource, ObjectType } from 'typeorm';

type Condition = {
    entity: ObjectType<any>;
    parentKey?: string;
    property?: string;
};

/**
 * 验证树形模型下同父节点同级别某个字段的唯一性
 */
@Injectable()
@ValidatorConstraint({ name: 'treeDataUnique', async: true })
export class UniqueTreeConstraint implements ValidatorConstraintInterface {
    constructor(private dataSource: DataSource) {}

    async validate(value: any, args: ValidationArguments) {
        const config: Omit<Condition, 'entity'> = {
            parentKey: 'parent',
            property: args.property,
        };
        const condition = ('entity' in args.constraints[0]
            ? merge(config, args.constraints[0])
            : {
                  ...config,
                  entity: args.constraints[0],
              }) as unknown as Required<Condition>;
        // 需要查询的属性名,默认为当前验证的属性
        const argsObj = args.object as any;
        if (!condition.entity) return false;

        try {
            // 获取repository
            const repo = this.dataSource.getTreeRepository(condition.entity);

            if (isNil(value)) return true;
            const collection = await repo.find({
                where: {
                    parent: !argsObj[condition.parentKey]
                        ? null
                        : { id: argsObj[condition.parentKey] },
                },
                withDeleted: true,
            });
            // 对比每个子分类的queryProperty值是否与当前验证的dto属性相同,如果有相同的则验证失败
            return collection.every((item) => item[condition.property] !== value);
        } catch (err) {
            return false;
        }
    }

    defaultMessage(args: ValidationArguments) {
        const { entity, property } = args.constraints[0];
        const queryProperty = property ?? args.property;
        if (!entity) {
            return 'Model not been specified!';
        }
        return `${queryProperty} of ${entity.name} must been unique with siblings element!`;
    }
}

/**
 * 树形模型下同父节点同级别某个字段的唯一性验证
 * @param params
 * @param validationOptions
 */
export function IsTreeUnique(
    params: ObjectType<any> | Condition,
    validationOptions?: ValidationOptions,
) {
    return (object: Record<string, any>, propertyName: string) => {
        registerDecorator({
            target: object.constructor,
            propertyName,
            options: validationOptions,
            constraints: [params],
            validator: UniqueTreeConstraint,
        });
    };
}
