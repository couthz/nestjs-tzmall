import path from 'path';

import { format } from '@sqltools/formatter/lib/sqlFormatter';
import chalk from 'chalk';
import { upperFirst } from 'lodash';
import { DataSource } from 'typeorm';

import { MigrationGenerateOptions } from '../types';

const { CommandUtils } = require('typeorm/commands/CommandUtils');
const { PlatformTools } = require('typeorm/platform/PlatformTools');
const { camelCase } = require('typeorm/util/StringUtils');
/**
 * Generates a new migration file with sql needs to be executed to update schema.
 */
type HandlerOptions = MigrationGenerateOptions & {
    dataSource: DataSource;
} & { dir: string };
export class TypeormMigrationGenerate {
    async handler(args: HandlerOptions) {
        const timestamp = new Date().getTime();
        const extension = '.ts';
        // const extension = args.outputJs ? '.js' : '.ts';
        const directory = args.dir.startsWith('/')
            ? args.dir
            : path.resolve(process.cwd(), args.dir);
        const filename = `${timestamp}-${args.name}`;
        const fullPath = `${directory}/${filename}${extension}`;
        const { dataSource } = args;
        try {
            dataSource.setOptions({
                synchronize: false,
                migrationsRun: false,
                dropSchema: false,
                logging: false,
            });
            await dataSource.initialize();
            const upSqls: string[] = [];
            const downSqls: string[] = [];

            try {
                const sqlInMemory = await dataSource.driver.createSchemaBuilder().log();

                if (args.pretty) {
                    sqlInMemory.upQueries.forEach((upQuery) => {
                        upQuery.query = TypeormMigrationGenerate.prettifyQuery(upQuery.query);
                    });
                    sqlInMemory.downQueries.forEach((downQuery) => {
                        downQuery.query = TypeormMigrationGenerate.prettifyQuery(downQuery.query);
                    });
                }

                sqlInMemory.upQueries.forEach((upQuery) => {
                    upSqls.push(
                        `        await queryRunner.query(\`${upQuery.query.replace(
                            /`/g,
                            '\\`',
                        )}\`${TypeormMigrationGenerate.queryParams(upQuery.parameters)});`,
                    );
                });
                sqlInMemory.downQueries.forEach((downQuery) => {
                    downSqls.push(
                        `        await queryRunner.query(\`${downQuery.query.replace(
                            /`/g,
                            '\\`',
                        )}\`${TypeormMigrationGenerate.queryParams(downQuery.parameters)});`,
                    );
                });
            } finally {
                await dataSource.destroy();
            }

            if (!upSqls.length) {
                console.log(chalk.green(`No changes in database schema were found`));
                process.exit(0);
            }

            const fileContent = TypeormMigrationGenerate.getTemplate(
                args.name,
                timestamp,
                upSqls,
                downSqls.reverse(),
            );
            if (args.check) {
                console.log(
                    chalk.yellow(
                        `Unexpected changes in database schema were found in check mode:\n\n${chalk.white(
                            fileContent,
                        )}`,
                    ),
                );
                process.exit(1);
            }

            if (args.dryrun) {
                console.log(
                    chalk.green(
                        `Migration ${chalk.blue(
                            fullPath + extension,
                        )} has content:\n\n${chalk.white(fileContent)}`,
                    ),
                );
            } else {
                await CommandUtils.createFile(fullPath, fileContent);

                console.log(
                    chalk.green(
                        `Migration ${chalk.blue(fullPath)} has been generated successfully.`,
                    ),
                );
            }
        } catch (err) {
            PlatformTools.logCmdErr('Error during migration generation:', err);
            process.exit(1);
        }
    }

    protected static queryParams(parameters: any[] | undefined): string {
        if (!parameters || !parameters.length) {
            return '';
        }

        return `, ${JSON.stringify(parameters)}`;
    }

    protected static getTemplate(
        name: string,
        timestamp: number,
        upSqls: string[],
        downSqls: string[],
    ): string {
        const migrationName = `${camelCase(upperFirst(name), true)}${timestamp}`;

        return `/* eslint-disable import/no-import-module-exports */
        import { MigrationInterface, QueryRunner } from "typeorm";

class ${migrationName} implements MigrationInterface {
    name = '${migrationName}'

    public async up(queryRunner: QueryRunner): Promise<void> {
${upSqls.join(`
`)}
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
${downSqls.join(`
`)}
    }

}

module.exports = ${migrationName}
`;
    }

    protected static prettifyQuery(query: string) {
        const formattedQuery = format(query, { indent: '    ' });
        return `\n${formattedQuery.replace(/^/gm, '            ')}\n        `;
    }
}
