import { Injectable } from '@nestjs/common';

import { isUndefined } from '@nestjs/common/utils/shared.utils';
import { ConfigGetOptions, NoInferType, Path, PathValue } from '@nestjs/config';
import { VALIDATED_ENV_PROPNAME } from '@nestjs/config/dist/config.constants';
import { get, has, set } from 'lodash';

type ValidatedResult<WasValidated extends boolean, T> = WasValidated extends true
    ? T
    : T | undefined;

type KeyOf<T> = keyof T extends never ? string : keyof T;

@Injectable()
export class ConfigureService<K = Record<string, unknown>, WasValidated extends boolean = false> {
    private set isCacheEnabled(value: boolean) {
        this._isCacheEnabled = value;
    }

    private get isCacheEnabled(): boolean {
        return this._isCacheEnabled;
    }

    private readonly cache: Partial<K> = {} as any;

    private _isCacheEnabled = false;

    private internalConfig: Record<string, any> = {};

    setInternalConfig(data: Record<string, any>) {
        this.internalConfig = data;
    }

    get<T = any>(propertyPath: KeyOf<K>): ValidatedResult<WasValidated, T>;

    get<T = K, P extends Path<T> = any, R = PathValue<T, P>>(
        propertyPath: P,
        options: ConfigGetOptions,
    ): ValidatedResult<WasValidated, R>;

    get<T = any>(propertyPath: KeyOf<K>, defaultValue: NoInferType<T>): T;

    get<T = K, P extends Path<T> = any, R = PathValue<T, P>>(
        propertyPath: P,
        defaultValue: NoInferType<R>,
        options: ConfigGetOptions,
    ): Exclude<R, undefined>;

    get<T = any>(
        propertyPath: KeyOf<K>,
        defaultValueOrOptions?: T | ConfigGetOptions,
        options?: ConfigGetOptions,
    ): T | undefined {
        const validatedEnvValue = this.getFromValidatedEnv(propertyPath);
        if (!isUndefined(validatedEnvValue)) {
            return validatedEnvValue;
        }
        const defaultValue =
            this.isGetOptionsObject(defaultValueOrOptions as Record<string, any>) && !options
                ? undefined
                : defaultValueOrOptions;

        const processEnvValue = this.getFromProcessEnv(propertyPath, defaultValue);
        if (!isUndefined(processEnvValue)) {
            return processEnvValue;
        }

        const internalValue = this.getFromInternalConfig(propertyPath);
        if (!isUndefined(internalValue)) {
            return internalValue;
        }

        return defaultValue as T;
    }

    getOrThrow<T = any>(propertyPath: KeyOf<K>): Exclude<T, undefined>;

    getOrThrow<T = K, P extends Path<T> = any, R = PathValue<T, P>>(
        propertyPath: P,
        options: ConfigGetOptions,
    ): Exclude<R, undefined>;

    getOrThrow<T = any>(
        propertyPath: KeyOf<K>,
        defaultValue: NoInferType<T>,
    ): Exclude<T, undefined>;

    getOrThrow<T = K, P extends Path<T> = any, R = PathValue<T, P>>(
        propertyPath: P,
        defaultValue: NoInferType<R>,
        options: ConfigGetOptions,
    ): Exclude<R, undefined>;

    getOrThrow<T = any>(
        propertyPath: KeyOf<K>,
        defaultValueOrOptions?: T | ConfigGetOptions,
        options?: ConfigGetOptions,
    ): Exclude<T, undefined> {
        // @ts-expect-error Bypass method overloads
        const value = this.get(propertyPath, defaultValueOrOptions, options) as T | undefined;

        if (isUndefined(value)) {
            throw new TypeError(`Configuration key "${propertyPath.toString()}" does not exist`);
        }

        return value as Exclude<T, undefined>;
    }

    private getFromCache<T = any>(propertyPath: KeyOf<K>, defaultValue?: T): T | undefined {
        const cachedValue = get(this.cache, propertyPath);
        return isUndefined(cachedValue) ? defaultValue : (cachedValue as unknown as T);
    }

    private getFromValidatedEnv<T = any>(propertyPath: KeyOf<K>): T | undefined {
        const validatedEnvValue = get(this.internalConfig[VALIDATED_ENV_PROPNAME], propertyPath);
        return validatedEnvValue as unknown as T;
    }

    private getFromProcessEnv<T = any>(propertyPath: KeyOf<K>, defaultValue: any): T | undefined {
        if (this.isCacheEnabled && has(this.cache as Record<any, any>, propertyPath)) {
            const cachedValue = this.getFromCache(propertyPath, defaultValue);
            return !isUndefined(cachedValue) ? cachedValue : defaultValue;
        }
        const processValue = get(process.env, propertyPath);
        this.setInCacheIfDefined(propertyPath, processValue);

        return processValue as unknown as T;
    }

    private getFromInternalConfig<T = any>(propertyPath: KeyOf<K>): T | undefined {
        const internalValue = get(this.internalConfig, propertyPath);
        return internalValue;
    }

    private setInCacheIfDefined(propertyPath: KeyOf<K>, value: any): void {
        if (typeof value === 'undefined') {
            return;
        }
        set(this.cache as Record<any, any>, propertyPath, value);
    }

    private isGetOptionsObject(
        options: Record<string, any> | undefined,
    ): options is ConfigGetOptions {
        return options && options?.infer && Object.keys(options).length === 1;
    }
}

export const configToken = {};
export const configure = new ConfigureService();
configure.setInternalConfig(configToken);
