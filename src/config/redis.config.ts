import { RedisModuleOptions } from "@liaoliaots/nestjs-redis"

export const redis = (): RedisModuleOptions => {
    return {
        config: [
            {
                namespace: 'default',
                url: `redis://:${process.env.REDIS_PASSWORD}@${process.env.REDIS_HOST}:${process.env.REDIS_PORT}/${process.env.REDIS_DB}`,
            }
        ]
    }
}
