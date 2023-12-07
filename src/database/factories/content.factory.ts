import * as fakerjs from '@faker-js/faker';

import { Configure } from '@/modules/config/configure';

import { CategoryEntity, CommentEntity, PostEntity, TagEntity } from '@/modules/content/entities';
import { getTime } from '@/modules/core/helpers';
import { defineFactory, getFakerLocales } from '@/modules/database/helpers';
import { UserEntity } from '@/modules/user/entities';

export type IPostFactoryOptions = Partial<{
    title: string;
    summary: string;
    body: string;
    isPublished: boolean;
    category: CategoryEntity;
    tags: TagEntity[];
    comments: CommentEntity[];
}> & { author: UserEntity };
export const ContentFactory = defineFactory(
    PostEntity,
    async (configure: Configure, options: IPostFactoryOptions) => {
        const faker = new fakerjs.Faker({
            locale: await getFakerLocales(configure),
        });
        const post = new PostEntity();
        const { title, summary, body, category, tags, author } = options;
        post.title = title ?? faker.lorem.sentence(Math.floor(Math.random() * 10) + 6);
        if (summary) {
            post.summary = options.summary;
        }
        post.body = body ?? faker.lorem.paragraph(Math.floor(Math.random() * 500) + 1);
        post.publishedAt = (await getTime(configure)).toDate();
        if (Math.random() >= 0.5) {
            post.deletedAt = (await getTime(configure)).toDate();
        }
        if (category) {
            post.category = category;
        }
        if (tags) {
            post.tags = tags;
        }
        post.author = author;
        return post;
    },
);
