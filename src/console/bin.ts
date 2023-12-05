#!/usr/bin/env node

import { createOptions } from '@/constants';

import { buildCli, createApp } from '../common/core/helpers';

buildCli(createApp(createOptions));
