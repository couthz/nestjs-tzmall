import { createOptions } from './constants';
import { listened } from './common/core/constants';
import { createApp, startApp } from './common/core/helpers/app';

startApp(createApp(createOptions), listened);
