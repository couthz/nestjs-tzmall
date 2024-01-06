import typeorm = require('typeorm');

class FLsGaP1704537819530 implements typeorm.MigrationInterface {
    name = 'FLsGaP1704537819530';

    public async up(queryRunner: typeorm.QueryRunner): Promise<void> {
        await queryRunner.query(
            `CREATE TABLE \`user_refresh_tokens\` (\`id\` varchar(36) NOT NULL, \`value\` varchar(500) NOT NULL, \`expired_at\` datetime NOT NULL COMMENT '令牌过期时间', \`createdAt\` datetime(6) NOT NULL COMMENT '令牌创建时间' DEFAULT CURRENT_TIMESTAMP(6), \`accessTokenId\` varchar(36) NULL, UNIQUE INDEX \`REL_1dfd080c2abf42198691b60ae3\` (\`accessTokenId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `CREATE TABLE \`rbac_roles\` (\`id\` varchar(36) NOT NULL, \`name\` varchar(255) NOT NULL COMMENT '角色名称', \`label\` varchar(255) NULL COMMENT '显示名称', \`description\` text NULL COMMENT '角色描述', \`systemed\` tinyint NOT NULL COMMENT '是否为不可更改的系统权限' DEFAULT 0, \`deletedAt\` datetime(6) NULL COMMENT '删除时间', PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `CREATE TABLE \`rbac_permissions\` (\`id\` varchar(36) NOT NULL, \`name\` varchar(255) NOT NULL COMMENT '权限名称', \`label\` varchar(255) NULL COMMENT '权限显示名', \`description\` text NULL COMMENT '权限描述', \`rule\` text NOT NULL COMMENT '权限规则', PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `CREATE TABLE \`users\` (\`id\` varchar(36) NOT NULL, \`nickname\` varchar(255) NULL COMMENT '姓名', \`username\` varchar(255) NOT NULL COMMENT '用户名', \`password\` varchar(500) NOT NULL COMMENT '密码', \`phone\` varchar(255) NULL COMMENT '手机号', \`email\` varchar(255) NULL COMMENT '邮箱', \`createdAt\` datetime(6) NOT NULL COMMENT '用户创建时间' DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL COMMENT '用户更新时间' DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL COMMENT '删除时间', UNIQUE INDEX \`IDX_fe0bb3f6520ee0469504521e71\` (\`username\`), UNIQUE INDEX \`IDX_a000cca60bcf04454e72769949\` (\`phone\`), UNIQUE INDEX \`IDX_97672ac88f789774dd47f7c8be\` (\`email\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `CREATE TABLE \`user_access_tokens\` (\`id\` varchar(36) NOT NULL, \`value\` varchar(500) NOT NULL, \`expired_at\` datetime NOT NULL COMMENT '令牌过期时间', \`createdAt\` datetime(6) NOT NULL COMMENT '令牌创建时间' DEFAULT CURRENT_TIMESTAMP(6), \`userId\` varchar(36) NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `CREATE TABLE \`content_comments\` (\`id\` varchar(36) NOT NULL, \`body\` text NOT NULL COMMENT '评论内容', \`createdAt\` datetime(6) NOT NULL COMMENT '创建时间' DEFAULT CURRENT_TIMESTAMP(6), \`mpath\` varchar(255) NULL DEFAULT '', \`parentId\` varchar(36) NULL, \`postId\` varchar(36) NOT NULL, \`authorId\` varchar(36) NOT NULL, FULLTEXT INDEX \`IDX_5f70a0489331d4346e46ea4d88\` (\`body\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `CREATE TABLE \`content_tags\` (\`id\` varchar(36) NOT NULL, \`name\` varchar(255) NOT NULL COMMENT '分类名称', \`description\` varchar(255) NULL COMMENT '标签描述', \`deletedAt\` datetime(6) NULL COMMENT '删除时间', FULLTEXT INDEX \`IDX_6f504a08a58010e15c55b1eb23\` (\`name\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `CREATE TABLE \`content_posts\` (\`id\` varchar(36) NOT NULL, \`title\` varchar(255) NOT NULL COMMENT '文章标题', \`body\` text NOT NULL COMMENT '文章内容', \`summary\` varchar(255) NULL COMMENT '文章描述', \`keywords\` text NULL COMMENT '关键字', \`type\` varchar(255) NOT NULL COMMENT '文章类型' DEFAULT 'markdown', \`publishedAt\` varchar(255) NULL COMMENT '发布时间', \`customOrder\` int NOT NULL COMMENT '自定义文章排序' DEFAULT '0', \`createdAt\` datetime(6) NOT NULL COMMENT '创建时间' DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL COMMENT '更新时间' DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL COMMENT '删除时间', \`categoryId\` varchar(36) NULL, \`authorId\` varchar(36) NOT NULL, FULLTEXT INDEX \`IDX_9ef6db9d13df6882d36c8af0cc\` (\`title\`), FULLTEXT INDEX \`IDX_e51068c39974ca11fae5d44c88\` (\`body\`), FULLTEXT INDEX \`IDX_f43723dc196c18767a3893a3f7\` (\`summary\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `CREATE TABLE \`content_categories\` (\`id\` varchar(36) NOT NULL, \`name\` varchar(255) NOT NULL COMMENT '分类名称', \`customOrder\` int NOT NULL COMMENT '分类排序' DEFAULT '0', \`deletedAt\` datetime(6) NULL COMMENT '删除时间', \`mpath\` varchar(255) NULL DEFAULT '', \`parentId\` varchar(36) NULL, FULLTEXT INDEX \`IDX_d6aaf8517ca57297a8c3a44d3d\` (\`name\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `CREATE TABLE \`rbac_roles_users_users\` (\`rbacRolesId\` varchar(36) NOT NULL, \`usersId\` varchar(36) NOT NULL, INDEX \`IDX_3c933e8c0950496fa3a616e4b2\` (\`rbacRolesId\`), INDEX \`IDX_789b5818a876ba2c4f058bdeb9\` (\`usersId\`), PRIMARY KEY (\`rbacRolesId\`, \`usersId\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `CREATE TABLE \`rbac_permissions_roles_rbac_roles\` (\`rbacPermissionsId\` varchar(36) NOT NULL, \`rbacRolesId\` varchar(36) NOT NULL, INDEX \`IDX_a3fab43faecb8e0f9b0345cedb\` (\`rbacPermissionsId\`), INDEX \`IDX_df26ec979184812b60c1c1a4e3\` (\`rbacRolesId\`), PRIMARY KEY (\`rbacPermissionsId\`, \`rbacRolesId\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `CREATE TABLE \`rbac_permissions_users_users\` (\`rbacPermissionsId\` varchar(36) NOT NULL, \`usersId\` varchar(36) NOT NULL, INDEX \`IDX_d12a35b88ace69f10656e31e58\` (\`rbacPermissionsId\`), INDEX \`IDX_5910a3c31c94389248bd34afc4\` (\`usersId\`), PRIMARY KEY (\`rbacPermissionsId\`, \`usersId\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `CREATE TABLE \`content_posts_tags_content_tags\` (\`contentPostsId\` varchar(36) NOT NULL, \`contentTagsId\` varchar(36) NOT NULL, INDEX \`IDX_1e8c41827d0d509e70de1f6b70\` (\`contentPostsId\`), INDEX \`IDX_888e6754015ee17f9e22faae57\` (\`contentTagsId\`), PRIMARY KEY (\`contentPostsId\`, \`contentTagsId\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `ALTER TABLE \`user_refresh_tokens\` ADD CONSTRAINT \`FK_1dfd080c2abf42198691b60ae39\` FOREIGN KEY (\`accessTokenId\`) REFERENCES \`user_access_tokens\`(\`id\`) ON DELETE CASCADE ON UPDATE NO ACTION`,
        );
        await queryRunner.query(
            `ALTER TABLE \`user_access_tokens\` ADD CONSTRAINT \`FK_71a030e491d5c8547fc1e38ef82\` FOREIGN KEY (\`userId\`) REFERENCES \`users\`(\`id\`) ON DELETE CASCADE ON UPDATE NO ACTION`,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_comments\` ADD CONSTRAINT \`FK_982a849f676860e5d6beb607f20\` FOREIGN KEY (\`parentId\`) REFERENCES \`content_comments\`(\`id\`) ON DELETE CASCADE ON UPDATE NO ACTION`,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_comments\` ADD CONSTRAINT \`FK_5e1c3747a0031f305e94493361f\` FOREIGN KEY (\`postId\`) REFERENCES \`content_posts\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_comments\` ADD CONSTRAINT \`FK_4a3469cba32f2dd9712821285e5\` FOREIGN KEY (\`authorId\`) REFERENCES \`users\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_posts\` ADD CONSTRAINT \`FK_4027367881933f659d02f367e92\` FOREIGN KEY (\`categoryId\`) REFERENCES \`content_categories\`(\`id\`) ON DELETE SET NULL ON UPDATE NO ACTION`,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_posts\` ADD CONSTRAINT \`FK_8fcc2d81ced7b8ade2bbd151b1a\` FOREIGN KEY (\`authorId\`) REFERENCES \`users\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_categories\` ADD CONSTRAINT \`FK_a03aea27707893300382b6f18ae\` FOREIGN KEY (\`parentId\`) REFERENCES \`content_categories\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
        );
        await queryRunner.query(
            `ALTER TABLE \`rbac_roles_users_users\` ADD CONSTRAINT \`FK_3c933e8c0950496fa3a616e4b27\` FOREIGN KEY (\`rbacRolesId\`) REFERENCES \`rbac_roles\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
        );
        await queryRunner.query(
            `ALTER TABLE \`rbac_roles_users_users\` ADD CONSTRAINT \`FK_789b5818a876ba2c4f058bdeb98\` FOREIGN KEY (\`usersId\`) REFERENCES \`users\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
        );
        await queryRunner.query(
            `ALTER TABLE \`rbac_permissions_roles_rbac_roles\` ADD CONSTRAINT \`FK_a3fab43faecb8e0f9b0345cedba\` FOREIGN KEY (\`rbacPermissionsId\`) REFERENCES \`rbac_permissions\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
        );
        await queryRunner.query(
            `ALTER TABLE \`rbac_permissions_roles_rbac_roles\` ADD CONSTRAINT \`FK_df26ec979184812b60c1c1a4e3a\` FOREIGN KEY (\`rbacRolesId\`) REFERENCES \`rbac_roles\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
        );
        await queryRunner.query(
            `ALTER TABLE \`rbac_permissions_users_users\` ADD CONSTRAINT \`FK_d12a35b88ace69f10656e31e587\` FOREIGN KEY (\`rbacPermissionsId\`) REFERENCES \`rbac_permissions\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
        );
        await queryRunner.query(
            `ALTER TABLE \`rbac_permissions_users_users\` ADD CONSTRAINT \`FK_5910a3c31c94389248bd34afc48\` FOREIGN KEY (\`usersId\`) REFERENCES \`users\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_posts_tags_content_tags\` ADD CONSTRAINT \`FK_1e8c41827d0d509e70de1f6b70e\` FOREIGN KEY (\`contentPostsId\`) REFERENCES \`content_posts\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_posts_tags_content_tags\` ADD CONSTRAINT \`FK_888e6754015ee17f9e22faae578\` FOREIGN KEY (\`contentTagsId\`) REFERENCES \`content_tags\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
        );
    }

    public async down(queryRunner: typeorm.QueryRunner): Promise<void> {
        await queryRunner.query(
            `ALTER TABLE \`content_posts_tags_content_tags\` DROP FOREIGN KEY \`FK_888e6754015ee17f9e22faae578\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_posts_tags_content_tags\` DROP FOREIGN KEY \`FK_1e8c41827d0d509e70de1f6b70e\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`rbac_permissions_users_users\` DROP FOREIGN KEY \`FK_5910a3c31c94389248bd34afc48\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`rbac_permissions_users_users\` DROP FOREIGN KEY \`FK_d12a35b88ace69f10656e31e587\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`rbac_permissions_roles_rbac_roles\` DROP FOREIGN KEY \`FK_df26ec979184812b60c1c1a4e3a\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`rbac_permissions_roles_rbac_roles\` DROP FOREIGN KEY \`FK_a3fab43faecb8e0f9b0345cedba\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`rbac_roles_users_users\` DROP FOREIGN KEY \`FK_789b5818a876ba2c4f058bdeb98\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`rbac_roles_users_users\` DROP FOREIGN KEY \`FK_3c933e8c0950496fa3a616e4b27\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_categories\` DROP FOREIGN KEY \`FK_a03aea27707893300382b6f18ae\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_posts\` DROP FOREIGN KEY \`FK_8fcc2d81ced7b8ade2bbd151b1a\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_posts\` DROP FOREIGN KEY \`FK_4027367881933f659d02f367e92\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_comments\` DROP FOREIGN KEY \`FK_4a3469cba32f2dd9712821285e5\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_comments\` DROP FOREIGN KEY \`FK_5e1c3747a0031f305e94493361f\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_comments\` DROP FOREIGN KEY \`FK_982a849f676860e5d6beb607f20\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`user_access_tokens\` DROP FOREIGN KEY \`FK_71a030e491d5c8547fc1e38ef82\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`user_refresh_tokens\` DROP FOREIGN KEY \`FK_1dfd080c2abf42198691b60ae39\``,
        );
        await queryRunner.query(
            `DROP INDEX \`IDX_888e6754015ee17f9e22faae57\` ON \`content_posts_tags_content_tags\``,
        );
        await queryRunner.query(
            `DROP INDEX \`IDX_1e8c41827d0d509e70de1f6b70\` ON \`content_posts_tags_content_tags\``,
        );
        await queryRunner.query(`DROP TABLE \`content_posts_tags_content_tags\``);
        await queryRunner.query(
            `DROP INDEX \`IDX_5910a3c31c94389248bd34afc4\` ON \`rbac_permissions_users_users\``,
        );
        await queryRunner.query(
            `DROP INDEX \`IDX_d12a35b88ace69f10656e31e58\` ON \`rbac_permissions_users_users\``,
        );
        await queryRunner.query(`DROP TABLE \`rbac_permissions_users_users\``);
        await queryRunner.query(
            `DROP INDEX \`IDX_df26ec979184812b60c1c1a4e3\` ON \`rbac_permissions_roles_rbac_roles\``,
        );
        await queryRunner.query(
            `DROP INDEX \`IDX_a3fab43faecb8e0f9b0345cedb\` ON \`rbac_permissions_roles_rbac_roles\``,
        );
        await queryRunner.query(`DROP TABLE \`rbac_permissions_roles_rbac_roles\``);
        await queryRunner.query(
            `DROP INDEX \`IDX_789b5818a876ba2c4f058bdeb9\` ON \`rbac_roles_users_users\``,
        );
        await queryRunner.query(
            `DROP INDEX \`IDX_3c933e8c0950496fa3a616e4b2\` ON \`rbac_roles_users_users\``,
        );
        await queryRunner.query(`DROP TABLE \`rbac_roles_users_users\``);
        await queryRunner.query(
            `DROP INDEX \`IDX_d6aaf8517ca57297a8c3a44d3d\` ON \`content_categories\``,
        );
        await queryRunner.query(`DROP TABLE \`content_categories\``);
        await queryRunner.query(
            `DROP INDEX \`IDX_f43723dc196c18767a3893a3f7\` ON \`content_posts\``,
        );
        await queryRunner.query(
            `DROP INDEX \`IDX_e51068c39974ca11fae5d44c88\` ON \`content_posts\``,
        );
        await queryRunner.query(
            `DROP INDEX \`IDX_9ef6db9d13df6882d36c8af0cc\` ON \`content_posts\``,
        );
        await queryRunner.query(`DROP TABLE \`content_posts\``);
        await queryRunner.query(
            `DROP INDEX \`IDX_6f504a08a58010e15c55b1eb23\` ON \`content_tags\``,
        );
        await queryRunner.query(`DROP TABLE \`content_tags\``);
        await queryRunner.query(
            `DROP INDEX \`IDX_5f70a0489331d4346e46ea4d88\` ON \`content_comments\``,
        );
        await queryRunner.query(`DROP TABLE \`content_comments\``);
        await queryRunner.query(`DROP TABLE \`user_access_tokens\``);
        await queryRunner.query(`DROP INDEX \`IDX_97672ac88f789774dd47f7c8be\` ON \`users\``);
        await queryRunner.query(`DROP INDEX \`IDX_a000cca60bcf04454e72769949\` ON \`users\``);
        await queryRunner.query(`DROP INDEX \`IDX_fe0bb3f6520ee0469504521e71\` ON \`users\``);
        await queryRunner.query(`DROP TABLE \`users\``);
        await queryRunner.query(`DROP TABLE \`rbac_permissions\``);
        await queryRunner.query(`DROP TABLE \`rbac_roles\``);
        await queryRunner.query(
            `DROP INDEX \`REL_1dfd080c2abf42198691b60ae3\` ON \`user_refresh_tokens\``,
        );
        await queryRunner.query(`DROP TABLE \`user_refresh_tokens\``);
    }
}

module.exports = FLsGaP1704537819530;
