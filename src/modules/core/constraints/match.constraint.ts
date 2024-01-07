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
        const [relatedProperty, reverse] = args.constraints;
        const relatedValue = (args.object as any)[relatedProperty];
        return reverse ? value !== relatedValue : value === relatedValue;
    }

    defaultMessage(args: ValidationArguments) {
        const [relatedProperty, reverse] = args.constraints;
        return `${relatedProperty} and ${args.property} ${reverse ? `is` : `don't`} match`;
    }
}

/**
 * 判断DTO中两个属性的值是否相等的验证规则
 * @param relatedProperty 用于对比的属性名称
 * @param reverse 是否反转
 * @param validationOptions class-validator库的选项
 */
export function IsMatch(
    relatedProperty: string,
    reverse = false,
    validationOptions?: ValidationOptions,
) {
    return (object: Record<string, any>, propertyName: string) => {
        registerDecorator({
            target: object.constructor,
            propertyName,
            options: validationOptions,
            constraints: [relatedProperty, reverse],
            validator: MatchConstraint,
        });
    };
}
