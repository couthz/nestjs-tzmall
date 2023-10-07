import { Module, ModuleMetadata } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

import { Configure } from '../config/configure';
import { DatabaseModule } from '../database/database.module';

import * as controllers from './controllers';
import * as entities from './entities';
import { defaultContentConfig } from './helpers';
import * as repositories from './repositories';
import * as services from './services';
import { PostService } from './services/post.service';
import { SanitizeService } from './services/sanitize.service';
import { PostSubscriber } from './subscribers';
import { ContentConfig } from './types';

@Module({})
export class ContentModule {
    static async forRoot(configure: Configure) {
        const config = await configure.get<ContentConfig>('content', defaultContentConfig);
        const providers: ModuleMetadata['providers'] = [
            ...Object.values(services),
            PostSubscriber,
            {
                provide: PostService,
                inject: [
                    repositories.PostRepository,
                    repositories.CategoryRepository,
                    services.CategoryService,
                    repositories.TagRepository,
                    { token: services.SearchService, optional: true },
                ],
                useFactory(
                    postRepository: repositories.PostRepository,
                    categoryRepository: repositories.CategoryRepository,
                    categoryService: services.CategoryService,
                    tagRepository: repositories.TagRepository,
                    searchService: services.SearchService,
                ) {
                    return new PostService(
                        postRepository,
                        categoryRepository,
                        categoryService,
                        tagRepository,
                        searchService,
                        config.searchType,
                    );
                },
            },
        ];
        if (config.htmlEnabled) providers.push(SanitizeService);
        if (config.searchType === 'meilli') providers.push(services.SearchService);
        return {
            module: ContentModule,
            imports: [
                TypeOrmModule.forFeature(Object.values(entities)),
                DatabaseModule.forRepository(Object.values(repositories)),
            ],
            controllers: Object.values(controllers),
            providers,
            exports: [
                ...Object.values(services),
                PostService,
                DatabaseModule.forRepository(Object.values(repositories)),
            ],
        };
    }
}
