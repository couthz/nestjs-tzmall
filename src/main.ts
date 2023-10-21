import { createOptions } from './constants';
import { listened } from './modules/core/constants';
import { createApp, startApp } from './modules/core/helpers/app';

startApp(createApp(createOptions), listened);
