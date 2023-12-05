import { Config } from 'meilisearch';

// MelliSearch模块的配置
export type MelliConfig = MelliOption[];

// MeilliSearch的连接节点配置
export type MelliOption = Config & { name: string };
