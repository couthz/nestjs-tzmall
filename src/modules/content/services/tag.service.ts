import { Injectable } from '@nestjs/common';

import { omit } from 'lodash';

import { BaseService } from '@/modules/database/base';

import { CreateTagDto, UpdateTagDto } from '../dtos';
import { TagEntity } from '../entities';
import { TagRepository } from '../repositories';

@Injectable()
export class TagService extends BaseService<TagEntity, TagRepository> {
    protected enableTrash = true;

    constructor(protected repository: TagRepository) {
        super(repository);
    }

    /**
     * 创建标签
     * @param data
     */
    async create(data: CreateTagDto) {
        const item = await this.repository.save(data);
        return this.detail(item.id);
    }

    /**
     * 更新标签
     * @param data
     */
    async update(data: UpdateTagDto) {
        await this.repository.update(data.id, omit(data, ['id']));
        return this.detail(data.id);
    }
}
