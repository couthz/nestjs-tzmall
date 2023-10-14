import { createOptions, listened } from './constants';
import { createApp, startApp } from './modules/core/helpers';

startApp(createApp(createOptions), listened);
