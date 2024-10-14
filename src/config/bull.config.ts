import { BullModuleOptions } from "@nestjs/bull";

export const bull = (): BullModuleOptions => {
    return {
        redis: {
            host: process.env.REDIS_HOST,
            port: parseInt(process.env.REDIS_PORT, 10),
            db: parseInt(process.env.REDIS_DB, 10),
            password: process.env.REDIS_PASSWORD,
        }
    }
}