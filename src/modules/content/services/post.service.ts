import { Injectable } from '@nestjs/common';

import { isArray, isFunction, isNil, omit, pick } from 'lodash';

import { EntityNotFoundError, In, IsNull, Not, SelectQueryBuilder } from 'typeorm';

import { SelectTrashMode } from '@/modules/database/constants';
import { paginate } from '@/modules/database/helpers';
import { QueryHook } from '@/modules/database/types';

import { PostOrderType } from '../constants';
import { CreatePostDto, QueryPostDto, UpdatePostDto } from '../dtos';
import { PostEntity } from '../entities';
import { CategoryRepository, PostRepository, TagRepository } from '../repositories';

import { SearchType } from '../types';

import { CategoryService } from './category.service';
import { SearchService } from './search.service';

// 文章查询接口
type FindParams = {
    [key in keyof Omit<QueryPostDto, 'limit' | 'page'>]: QueryPostDto[key];
};

/**
 * 文章数据操作
 */
@Injectable()
export class PostService {
    constructor(
        protected repository: PostRepository,
        protected categoryRepository: CategoryRepository,
        protected categoryService: CategoryService,
        protected tagRepository: TagRepository,
        protected searchService?: SearchService,
        protected search_type: SearchType = 'against',
    ) {}

    /**
     * 获取分页数据
     * @param options 分页选项
     * @param callback 添加额外的查询
     */
    async paginate(options: QueryPostDto, callback?: QueryHook<PostEntity>) {
        if (!isNil(this.searchService) && !isNil(options.search) && this.search_type === 'meilli') {
            return this.searchService.search(
                options.search,
                pick(options, ['trashed', 'page', 'limit']),
            );
        }
        const qb = await this.buildListQuery(this.repository.buildBaseQB(), options, callback);
        return paginate(qb, options);
    }

    /**
     * 查询单篇文章
     * @param id
     * @param callback 添加额外的查询
     */
    async detail(id: string, callback?: QueryHook<PostEntity>) {
        let qb = this.repository.buildBaseQB();
        qb.where(`post.id = :id`, { id });
        qb = !isNil(callback) && isFunction(callback) ? await callback(qb) : qb;
        const item = await qb.getOne();
        if (!item) throw new EntityNotFoundError(PostEntity, `The post ${id} not exists!`);
        return item;
    }

    /**
     * 创建文章
     * @param data
     */
    async create(data: CreatePostDto) {
        const createPostDto = {
            ...data,
            // 文章所属的分类
            category: !isNil(data.category)
                ? await this.categoryRepository.findOneOrFail({ where: { id: data.category } })
                : null,
            // 文章关联的标签
            tags: isArray(data.tags)
                ? await this.tagRepository.findBy({
                      id: In(data.tags),
                  })
                : [],
        };
        const item = await this.repository.save(createPostDto);
        if (!isNil(this.searchService)) await this.searchService.create(item);
        return this.detail(item.id);
    }

    /**
     * 更新文章
     * @param data
     */
    async update(data: UpdatePostDto) {
        const post = await this.detail(data.id);
        if (data.category !== undefined) {
            // 更新分类
            const category = isNil(data.category)
                ? null
                : await this.categoryRepository.findOneByOrFail({ id: data.category });
            post.category = category;
            await this.repository.save(post);
        }
        if (isArray(data.tags)) {
            // 更新文章关联标签
            await this.repository
                .createQueryBuilder('post')
                .relation(PostEntity, 'tags')
                .of(post)
                .addAndRemove(data.tags, post.tags ?? []);
        }
        await this.repository.update(data.id, omit(data, ['id', 'tags', 'category']));
        const result = await this.detail(data.id);
        if (!isNil(this.searchService)) await this.searchService.update([post]);
        return result;
    }

    /**
     * 删除文章
     * @param id
     */
    async delete(ids: string[], trash?: boolean) {
        const items = await this.repository.find({
            where: { id: In(ids) },
            withDeleted: true,
        });
        let result: PostEntity[] = [];
        if (trash) {
            // 对已软删除的数据再次删除时直接通过remove方法从数据库中清除
            const directs = items.filter((item) => !isNil(item.deletedAt));
            const softs = items.filter((item) => isNil(item.deletedAt));
            result = [
                ...(await this.repository.remove(directs)),
                ...(await this.repository.softRemove(softs)),
            ];
            if (!isNil(this.searchService)) {
                await this.searchService.delete(directs.map(({ id }) => id));
                await this.searchService.update(softs);
            }
        } else {
            result = await this.repository.remove(items);
            if (!isNil(this.searchService)) {
                await this.searchService.delete(result.map(({ id }) => id));
            }
        }
        return result;
    }

    /**
     * 恢复文章
     * @param ids
     */
    async restore(ids: string[]) {
        const items = await this.repository.find({
            where: { id: In(ids) },
            withDeleted: true,
        });
        // 过滤掉不在回收站中的数据
        const trasheds = items.filter((item) => !isNil(item)).map((item) => item.id);
        if (trasheds.length < 1) return [];
        await this.repository.restore(trasheds);
        const qb = await this.buildListQuery(this.repository.buildBaseQB(), {}, async (qbuilder) =>
            qbuilder.andWhereInIds(trasheds),
        );
        return qb.getMany();
    }

    /**
     * 构建文章列表查询器
     * @param qb 初始查询构造器
     * @param options 排查分页选项后的查询选项
     * @param callback 添加额外的查询
     */
    protected async buildListQuery(
        qb: SelectQueryBuilder<PostEntity>,
        options: FindParams,
        callback?: QueryHook<PostEntity>,
    ) {
        const { category, tag, orderBy, isPublished, trashed = SelectTrashMode.NONE } = options;
        // 是否查询回收站
        if (trashed === SelectTrashMode.ALL || trashed === SelectTrashMode.ONLY) {
            qb.withDeleted();
            if (trashed === SelectTrashMode.ONLY) qb.where(`post.deletedAt is not null`);
        }
        if (typeof isPublished === 'boolean') {
            isPublished
                ? qb.where({
                      publishedAt: Not(IsNull()),
                  })
                : qb.where({
                      publishedAt: IsNull(),
                  });
        }

        this.queryOrderBy(qb, orderBy);
        if (category) await this.queryByCategory(category, qb);
        if (!isNil(options.search)) this.buildSearchQuery(qb, options.search);
        // 查询某个标签关联的文章
        if (tag) qb.where('tags.id = :id', { id: tag });
        if (callback) return callback(qb);
        return qb;
    }

    protected async buildSearchQuery(qb: SelectQueryBuilder<PostEntity>, search: string) {
        if (this.search_type === 'like') {
            qb.andWhere('title LIKE :search', { search: `%${search}%` })
                .orWhere('body LIKE :search', { search: `%${search}%` })
                .orWhere('summary LIKE :search', { search: `%${search}%` })
                .orWhere('category.name LIKE :search', {
                    search: `%${search}%`,
                })
                .orWhere('tags.name LIKE :search', {
                    search: `%${search}%`,
                });
        } else if (this.search_type === 'against') {
            qb.andWhere('MATCH(title) AGAINST (:search IN BOOLEAN MODE)', {
                search: `${search}*`,
            })
                .orWhere('MATCH(body) AGAINST (:search IN BOOLEAN MODE)', {
                    search: `${search}*`,
                })
                .orWhere('MATCH(summary) AGAINST (:search IN BOOLEAN MODE)', {
                    search: `${search}*`,
                })
                .orWhere('MATCH(category.name) AGAINST (:search IN BOOLEAN MODE)', {
                    search: `${search}*`,
                })
                .orWhere('MATCH(tags.name) AGAINST (:search IN BOOLEAN MODE)', {
                    search: `${search}*`,
                });
        }
        return qb;
    }

    /**
     *  对文章进行排序的Query构建
     * @param qb
     * @param orderBy 排序方式
     */
    protected queryOrderBy(qb: SelectQueryBuilder<PostEntity>, orderBy?: PostOrderType) {
        switch (orderBy) {
            case PostOrderType.CREATED:
                return qb.orderBy('post.createdAt', 'DESC');
            case PostOrderType.UPDATED:
                return qb.orderBy('post.updatedAt', 'DESC');
            case PostOrderType.PUBLISHED:
                return qb.orderBy('post.publishedAt', 'DESC');
            case PostOrderType.COMMENTCOUNT:
                return qb.orderBy('commentCount', 'DESC');
            case PostOrderType.CUSTOM:
                return qb.orderBy('customOrder', 'DESC');
            default:
                return qb
                    .orderBy('post.createdAt', 'DESC')
                    .addOrderBy('post.updatedAt', 'DESC')
                    .addOrderBy('post.publishedAt', 'DESC')
                    .addOrderBy('commentCount', 'DESC');
        }
    }

    /**
     * 查询出分类及其后代分类下的所有文章的Query构建
     * @param id
     * @param qb
     */
    protected async queryByCategory(id: string, qb: SelectQueryBuilder<PostEntity>) {
        const root = await this.categoryService.detail(id);
        const tree = await this.categoryRepository.findDescendantsTree(root);
        const flatDes = await this.categoryRepository.toFlatTrees(tree.children);
        const ids = [tree.id, ...flatDes.map((item) => item.id)];
        return qb.where('category.id IN (:...ids)', {
            ids,
        });
    }
}
