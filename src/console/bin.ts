#!/usr/bin/env node

import { createOptions } from '@/constants';

import { buildCli, createApp } from '../modules/core/helpers';

buildCli(createApp(createOptions));
