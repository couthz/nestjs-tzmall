import { Injectable } from '@nestjs/common';
import {
    ValidationArguments,
    ValidationOptions,
    ValidatorConstraint,
    ValidatorConstraintInterface,
    registerDecorator,
} from 'class-validator';
import { merge } from 'lodash';
import { DataSource, ObjectType } from 'typeorm';

type Condition = {
    entity: ObjectType<any>;
    /**
     * 默认忽略字段为id
     */
    ignore?: string;
    /**
     * 查询条件字段,默认为指定的ignore
     */
    findKey?: string;
    /**
     * 需要查询的属性名,默认为当前验证的属性
     */
    property?: string;
};

/**
 * 在更新时验证树形数据同父节点同级别某个字段的唯一性,通过ignore指定忽略的字段
 */
@Injectable()
@ValidatorConstraint({ name: 'treeDataUniqueExist', async: true })
export class UniqueTreeExistConstraint implements ValidatorConstraintInterface {
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
        if (!condition.findKey) {
            condition.findKey = condition.ignore;
        }
        if (!condition.entity) return false;
        // 在传入的dto数据中获取需要忽略的字段的值
        const ignoreValue = (args.object as any)[condition.ignore];
        // 查询条件字段的值
        const keyValue = (args.object as any)[condition.findKey];
        if (!ignoreValue || !keyValue) return false;
        const repo = this.dataSource.getTreeRepository(condition.entity);
        // 根据查询条件查询出当前验证的数据
        const item = await repo.findOne({
            where: { [condition.findKey]: keyValue },
            relations: ['parent'],
        });
        // 没有此数据则验证失败
        if (!item) return false;
        // 如果验证数据没有parent则把所有顶级分类作为验证数据否则就把同一个父分类下的子分类作为验证数据
        const rows: any[] = await repo.find({
            where: {
                parent: !item.parent ? null : { id: item.parent.id },
            },
            withDeleted: true,
        });
        // 在忽略本身数据后如果同级别其它数据与验证的queryProperty的值相同则验证失败
        return !rows.find(
            (row) => row[condition.property] === value && row[condition.ignore] !== ignoreValue,
        );
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
 * 树形数据同父节点同级别某个字段的唯一性验证
 * @param params
 * @param validationOptions
 */
export function IsTreeUniqueExist(
    params: ObjectType<any> | Condition,
    validationOptions?: ValidationOptions,
) {
    return (object: Record<string, any>, propertyName: string) => {
        registerDecorator({
            target: object.constructor,
            propertyName,
            options: validationOptions,
            constraints: [params],
            validator: UniqueTreeExistConstraint,
        });
    };
}
