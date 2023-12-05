import { MelliConfig } from '@/common/meilisearch/types';

export const meilli = (): MelliConfig => [
    {
        name: 'default',
        host: 'http://localhost:7700',
    },
];
