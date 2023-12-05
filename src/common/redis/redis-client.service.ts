import { RedisService } from "@liaoliaots/nestjs-redis";
import { Injectable } from "@nestjs/common";
import { Redis } from 'ioredis';

@Injectable()
export class RedisClientService {
    constructor(private readonly redisService: RedisService) {
        console.log('RedisClientService');
    }

    getClient(name: string = 'default'): Redis {
        return this.redisService.getClient(name);
    }
}