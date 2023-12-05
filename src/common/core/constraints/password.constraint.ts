import {
    registerDecorator,
    ValidationArguments,
    ValidationOptions,
    ValidatorConstraint,
    ValidatorConstraintInterface,
} from 'class-validator';

type ModelType = 1 | 2 | 3 | 4 | 5;

/**
 * 密码验证规则
 */
@ValidatorConstraint({ name: 'isPassword', async: false })
export class IsPasswordConstraint implements ValidatorConstraintInterface {
    validate(value: string, args: ValidationArguments) {
        const validateModel: ModelType = args.constraints[0] ?? 1;
        switch (validateModel) {
            // 必须由大写或小写字母组成(默认模式)
            case 1:
                return /\d/.test(value) && /[a-zA-Z]/.test(value);
            // 必须由小写字母组成
            case 2:
                return /\d/.test(value) && /[a-z]/.test(value);
            // 必须由大写字母组成
            case 3:
                return /\d/.test(value) && /[A-Z]/.test(value);
            // 必须包含数字,小写字母,大写字母
            case 4:
                return /\d/.test(value) && /[a-z]/.test(value) && /[A-Z]/.test(value);
            // 必须包含数字,小写字母,大写字母,特殊符号
            case 5:
                return (
                    /\d/.test(value) &&
                    /[a-z]/.test(value) &&
                    /[A-Z]/.test(value) &&
                    /[!@#$%^&]/.test(value)
                );
            default:
                return /\d/.test(value) && /[a-zA-Z]/.test(value);
        }
    }

    defaultMessage(_args: ValidationArguments) {
        return "($value) 's format error!";
    }
}

/**
 * 密码复杂度验证
 * 模式1: 必须由大写或小写字母组成(默认模式)
 * 模式2: 必须由小写字母组成
 * 模式3: 必须由大写字母组成
 * 模式4: 必须包含数字,小写字母,大写字母
 * 模式5: 必须包含数字,小写字母,大写字母,特殊符号
 * @param model 验证模式
 * @param validationOptions
 */
export function IsPassword(model?: ModelType, validationOptions?: ValidationOptions) {
    return (object: Record<string, any>, propertyName: string) => {
        registerDecorator({
            target: object.constructor,
            propertyName,
            options: validationOptions,
            constraints: [model],
            validator: IsPasswordConstraint,
        });
    };
}
