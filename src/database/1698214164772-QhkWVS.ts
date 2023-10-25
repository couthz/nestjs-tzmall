/* eslint-disable import/no-import-module-exports */
import { MigrationInterface, QueryRunner } from 'typeorm';

class QhkWVS1698214164772 implements MigrationInterface {
    name = 'QhkWVS1698214164772';

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(
            `CREATE TABLE \`content_comments\` (\`id\` varchar(36) NOT NULL, \`body\` text NOT NULL COMMENT '评论内容', \`createdAt\` datetime(6) NOT NULL COMMENT '创建时间' DEFAULT CURRENT_TIMESTAMP(6), \`mpath\` varchar(255) NULL DEFAULT '', \`parentId\` varchar(36) NULL, \`postId\` varchar(36) NOT NULL, FULLTEXT INDEX \`IDX_5f70a0489331d4346e46ea4d88\` (\`body\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `CREATE TABLE \`content_tags\` (\`id\` varchar(36) NOT NULL, \`name\` varchar(255) NOT NULL COMMENT '分类名称', \`description\` varchar(255) NULL COMMENT '标签描述', \`deletedAt\` datetime(6) NULL COMMENT '删除时间', FULLTEXT INDEX \`IDX_6f504a08a58010e15c55b1eb23\` (\`name\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `CREATE TABLE \`content_posts\` (\`id\` varchar(36) NOT NULL, \`title\` varchar(255) NOT NULL COMMENT '文章标题', \`body\` text NOT NULL COMMENT '文章内容', \`summary\` varchar(255) NULL COMMENT '文章描述', \`keywords\` text NULL COMMENT '关键字', \`type\` varchar(255) NOT NULL COMMENT '文章类型' DEFAULT 'markdown', \`publishedAt\` varchar(255) NULL COMMENT '发布时间', \`customOrder\` int NOT NULL COMMENT '自定义文章排序' DEFAULT '0', \`createdAt\` datetime(6) NOT NULL COMMENT '创建时间' DEFAULT CURRENT_TIMESTAMP(6), \`updatedAt\` datetime(6) NOT NULL COMMENT '更新时间' DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6), \`deletedAt\` datetime(6) NULL COMMENT '删除时间', \`categoryId\` varchar(36) NULL, FULLTEXT INDEX \`IDX_9ef6db9d13df6882d36c8af0cc\` (\`title\`), FULLTEXT INDEX \`IDX_e51068c39974ca11fae5d44c88\` (\`body\`), FULLTEXT INDEX \`IDX_f43723dc196c18767a3893a3f7\` (\`summary\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `CREATE TABLE \`content_categories\` (\`id\` varchar(36) NOT NULL, \`name\` varchar(255) NOT NULL COMMENT '分类名称', \`customOrder\` int NOT NULL COMMENT '分类排序' DEFAULT '0', \`deletedAt\` datetime(6) NULL COMMENT '删除时间', \`mpath\` varchar(255) NULL DEFAULT '', \`parentId\` varchar(36) NULL, FULLTEXT INDEX \`IDX_d6aaf8517ca57297a8c3a44d3d\` (\`name\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `CREATE TABLE \`content_bs\` (\`id\` varchar(36) NOT NULL, \`name\` varchar(255) NOT NULL COMMENT '分类名称', \`description\` varchar(255) NULL COMMENT '标签描述', \`deletedAt\` datetime(6) NULL COMMENT '删除时间', FULLTEXT INDEX \`IDX_421e02a50d959c3564c6c8e478\` (\`name\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `CREATE TABLE \`content_posts_tags_content_tags\` (\`contentPostsId\` varchar(36) NOT NULL, \`contentTagsId\` varchar(36) NOT NULL, INDEX \`IDX_1e8c41827d0d509e70de1f6b70\` (\`contentPostsId\`), INDEX \`IDX_888e6754015ee17f9e22faae57\` (\`contentTagsId\`), PRIMARY KEY (\`contentPostsId\`, \`contentTagsId\`)) ENGINE=InnoDB`,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_comments\` ADD CONSTRAINT \`FK_982a849f676860e5d6beb607f20\` FOREIGN KEY (\`parentId\`) REFERENCES \`content_comments\`(\`id\`) ON DELETE CASCADE ON UPDATE NO ACTION`,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_comments\` ADD CONSTRAINT \`FK_5e1c3747a0031f305e94493361f\` FOREIGN KEY (\`postId\`) REFERENCES \`content_posts\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_posts\` ADD CONSTRAINT \`FK_4027367881933f659d02f367e92\` FOREIGN KEY (\`categoryId\`) REFERENCES \`content_categories\`(\`id\`) ON DELETE SET NULL ON UPDATE NO ACTION`,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_categories\` ADD CONSTRAINT \`FK_a03aea27707893300382b6f18ae\` FOREIGN KEY (\`parentId\`) REFERENCES \`content_categories\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_posts_tags_content_tags\` ADD CONSTRAINT \`FK_1e8c41827d0d509e70de1f6b70e\` FOREIGN KEY (\`contentPostsId\`) REFERENCES \`content_posts\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_posts_tags_content_tags\` ADD CONSTRAINT \`FK_888e6754015ee17f9e22faae578\` FOREIGN KEY (\`contentTagsId\`) REFERENCES \`content_tags\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`,
        );
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(
            `ALTER TABLE \`content_posts_tags_content_tags\` DROP FOREIGN KEY \`FK_888e6754015ee17f9e22faae578\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_posts_tags_content_tags\` DROP FOREIGN KEY \`FK_1e8c41827d0d509e70de1f6b70e\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_categories\` DROP FOREIGN KEY \`FK_a03aea27707893300382b6f18ae\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_posts\` DROP FOREIGN KEY \`FK_4027367881933f659d02f367e92\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_comments\` DROP FOREIGN KEY \`FK_5e1c3747a0031f305e94493361f\``,
        );
        await queryRunner.query(
            `ALTER TABLE \`content_comments\` DROP FOREIGN KEY \`FK_982a849f676860e5d6beb607f20\``,
        );
        await queryRunner.query(
            `DROP INDEX \`IDX_888e6754015ee17f9e22faae57\` ON \`content_posts_tags_content_tags\``,
        );
        await queryRunner.query(
            `DROP INDEX \`IDX_1e8c41827d0d509e70de1f6b70\` ON \`content_posts_tags_content_tags\``,
        );
        await queryRunner.query(`DROP TABLE \`content_posts_tags_content_tags\``);
        await queryRunner.query(`DROP INDEX \`IDX_421e02a50d959c3564c6c8e478\` ON \`content_bs\``);
        await queryRunner.query(`DROP TABLE \`content_bs\``);
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
    }
}

module.exports = QhkWVS1698214164772;
