import { DataSource } from 'typeorm';

import { MigrationRevertOptions } from '../types';

type HandlerOptions = MigrationRevertOptions & { dataSource: DataSource };
export class TypeormMigrationRevert {
    async handler({ transaction, fake, dataSource }: HandlerOptions) {
        const options = {
            transaction:
                dataSource.options.migrationsTransactionMode ?? ('all' as 'all' | 'none' | 'each'),
            fake,
        };
        switch (transaction) {
            case 'all':
                options.transaction = 'all';
                break;
            case 'none':
            case 'false':
                options.transaction = 'none';
                break;
            case 'each':
                options.transaction = 'each';
                break;
            default:
            // noop
        }

        await dataSource.undoLastMigration(options);
    }
}
