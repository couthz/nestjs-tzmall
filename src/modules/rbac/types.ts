import { AbilityTuple, MongoAbility, MongoQuery, RawRuleFrom } from '@casl/ability';
import { ModuleRef } from '@nestjs/core';
import { FastifyRequest as Request } from 'fastify';

import { UserEntity } from '../user/entities';

import { UserRepository } from '../user/repositories';

import { PermissionEntity, RoleEntity } from './entities';
import { RbacResolver } from './rbac.resolver';

export type PermissionChecker = (
    ability: MongoAbility,
    ref?: ModuleRef,
    request?: Request,
) => Promise<boolean>;

export type Role = Pick<ClassToPlain<RoleEntity>, 'name' | 'label' | 'description'> & {
    permissions: string[];
};
export type PermissionType<A extends AbilityTuple, C extends MongoQuery> = Pick<
    ClassToPlain<PermissionEntity<A, C>>,
    'name'
> &
    Partial<Pick<ClassToPlain<PermissionEntity<A, C>>, 'label' | 'description'>> & {
        rule: Omit<RawRuleFrom<A, C>, 'conditions'> & {
            conditions?: (user: ClassToPlain<UserEntity>) => Record<string, any>;
        };
    };
export type CheckerParams = {
    resolver: RbacResolver;
    repository: UserRepository;
    checkers: PermissionChecker[];
    moduleRef?: ModuleRef;
    request?: any;
};
