/* eslint-disable import/no-import-module-exports */
        import { MigrationInterface, QueryRunner } from "typeorm";

class LMBgrv1701667918109 implements MigrationInterface {
    name = 'LMBgrv1701667918109'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`tz_order_item\` CHANGE \`order_id\` \`order_id\` bigint UNSIGNED NOT NULL COMMENT '订单ID'`);
        await queryRunner.query(`ALTER TABLE \`tz_order_item\` ADD CONSTRAINT \`FK_fbe47b28f30750ed81a745ba5f6\` FOREIGN KEY (\`order_id\`) REFERENCES \`tz_order\`(\`order_id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`tz_prod_tag_reference\` ADD CONSTRAINT \`FK_42478dfcb513226dc19b76589f4\` FOREIGN KEY (\`prod_id\`) REFERENCES \`tz_prod\`(\`prod_id\`) ON DELETE CASCADE ON UPDATE CASCADE`);
        await queryRunner.query(`ALTER TABLE \`tz_prod_cate_reference\` ADD CONSTRAINT \`FK_b78629c7998b76eb57f4d44d266\` FOREIGN KEY (\`prod_id\`) REFERENCES \`tz_prod\`(\`prod_id\`) ON DELETE CASCADE ON UPDATE CASCADE`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`tz_prod_cate_reference\` DROP FOREIGN KEY \`FK_b78629c7998b76eb57f4d44d266\``);
        await queryRunner.query(`ALTER TABLE \`tz_prod_tag_reference\` DROP FOREIGN KEY \`FK_42478dfcb513226dc19b76589f4\``);
        await queryRunner.query(`ALTER TABLE \`tz_order_item\` DROP FOREIGN KEY \`FK_fbe47b28f30750ed81a745ba5f6\``);
        await queryRunner.query(`ALTER TABLE \`tz_order_item\` CHANGE \`order_id\` \`order_id\` bigint NOT NULL COMMENT '订单ID'`);
    }

}

module.exports = LMBgrv1701667918109
