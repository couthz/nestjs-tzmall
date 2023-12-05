import { isNil } from 'lodash';

import { ConnectionOption, ConnectionRst } from './types';

/**
 * 用于快捷生成Typeorm,Redis等连接的配置
 * @param options
 */
export const createConnectionOptions = <T extends Record<string, any>>(
    config: ConnectionOption<T> | ConnectionOption<T>[],
) => {
    const options = (
        Array.isArray(config) ? config : [{ ...config, name: 'default' }]
    ) as ConnectionRst<T>;
    if (options.length <= 0) return undefined;
    const names = options.map(({ name }) => name);
    if (!names.includes('default')) options[0].name = 'default';

    // 去重
    return options
        .filter(({ name }) => !isNil(name))
        .reduce((o, n) => {
            const oldNames = o.map(({ name }) => name) as string[];
            return oldNames.includes(n.name) ? o : [...o, n];
        }, []);
};
