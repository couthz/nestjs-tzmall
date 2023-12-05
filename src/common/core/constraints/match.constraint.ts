import {
    registerDecorator,
    ValidationArguments,
    ValidationOptions,
    ValidatorConstraint,
    ValidatorConstraintInterface,
} from 'class-validator';

/**
 * 判断两个字段的值是否相等的验证规则
 */
@ValidatorConstraint({ name: 'isMatch' })
export class MatchConstraint implements ValidatorConstraintInterface {
    validate(value: any, args: ValidationArguments) {
        const [relatedProperty] = args.constraints;
        const relatedValue = (args.object as any)[relatedProperty];
        return value === relatedValue;
    }

    defaultMessage(args: ValidationArguments) {
        const [relatedProperty] = args.constraints;
        return `${relatedProperty} and ${args.property} don't match`;
    }
}

/**
 * 判断DTO中两个属性的值是否相等的验证规则
 * @param relatedProperty 用于对比的属性名称
 * @param validationOptions class-validator库的选项
 */
export function IsMatch(relatedProperty: string, validationOptions?: ValidationOptions) {
    return (object: Record<string, any>, propertyName: string) => {
        registerDecorator({
            target: object.constructor,
            propertyName,
            options: validationOptions,
            constraints: [relatedProperty],
            validator: MatchConstraint,
        });
    };
}
