import { toNumber } from 'lodash';

import { createAppConfig } from '@/modules/core/helpers';

export const app = createAppConfig((configure) => ({
    port: configure.env.get('APP_PORT', (v) => toNumber(v), 3200),
    prefix: 'api',
}));
