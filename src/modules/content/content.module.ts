import { Module, ModuleMetadata } from '@nestjs/common';

import { Configure } from '../config/configure';
import { DatabaseModule } from '../database/database.module';

import { addEntities, addSubscribers } from '../database/helpers';

import { RbacModule } from '../rbac/rbac.module';
import { UserRepository } from '../user/repositories/user.repository';

import { UserModule } from '../user/user.module';

import * as entities from './entities';
import { defaultContentConfig } from './helpers';
import { ContentRbac } from './rbac';
import * as repositories from './repositories';
import * as services from './services';
import { PostService } from './services/post.service';
import { SanitizeService } from './services/sanitize.service';
import * as subscribers from './subscribers';
import { ContentConfig } from './types';

@Module({})
export class ContentModule {
    static async forRoot(configure: Configure) {
        const config = await configure.get<ContentConfig>('content', defaultContentConfig);
        const providers: ModuleMetadata['providers'] = [
            ...Object.values(services),
            ...(await addSubscribers(configure, Object.values(subscribers))),
            ContentRbac,
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
                    userRepository: UserRepository,
                    searchService: services.SearchService,
                ) {
                    return new PostService(
                        postRepository,
                        categoryRepository,
                        categoryService,
                        tagRepository,
                        userRepository,
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
                UserModule,
                RbacModule,
                addEntities(configure, Object.values(entities)),
                DatabaseModule.forRepository(Object.values(repositories)),
            ],
            providers,
            exports: [
                ...Object.values(services),
                PostService,
                DatabaseModule.forRepository(Object.values(repositories)),
            ],
        };
    }
}
