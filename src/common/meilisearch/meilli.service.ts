import { Injectable } from '@nestjs/common';

import { isNil } from 'lodash';
import MeiliSearch from 'meilisearch';

import type { MelliConfig } from './types';

@Injectable()
export class MeilliService {
    protected options: MelliConfig;

    /**
     * 客户端连接
     */
    protected clients: Map<string, MeiliSearch> = new Map();

    constructor(options: MelliConfig) {
        this.options = options;
    }

    getOptions() {
        return this.options;
    }

    /**
     * 通过配置创建所有连接
     */
    async createClients() {
        this.options.forEach(async (o) => {
            this.clients.set(o.name, new MeiliSearch(o));
        });
    }

    /**
     * 获取一个客户端连接
     * @param name 连接名称,默认default
     */
    getClient(name?: string): MeiliSearch {
        let key = 'default';
        if (!isNil(name)) key = name;
        if (!this.clients.has(key)) {
            throw new Error(`client ${key} does not exist`);
        }
        return this.clients.get(key);
    }

    /**
     * 获取所有客户端连接
     */
    getClients(): Map<string, MeiliSearch> {
        return this.clients;
    }
}
