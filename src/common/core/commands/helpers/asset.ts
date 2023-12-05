/* eslint-disable import/no-extraneous-dependencies */
import { join } from 'path';

import { AssetEntry, ActionOnFile } from '@nestjs/cli/lib/configuration';
import chokidar from 'chokidar';

import { get } from 'lodash';

import { toBoolean } from '../../helpers';
import { CLIConfig } from '../types';

export class Asset {
    private watchAssetsKeyValue: { [key: string]: boolean } = {};

    private watchers: chokidar.FSWatcher[] = [];

    private actionInProgress = false;

    closeWatchers() {
        const timeoutMs = 500;
        const closeFn = () => {
            if (this.actionInProgress) {
                this.actionInProgress = false;
                setTimeout(closeFn, timeoutMs);
            } else {
                this.watchers.forEach((watcher) => watcher.close());
            }
        };

        setTimeout(closeFn, timeoutMs);
    }

    watchAssets(config: CLIConfig, codePath: string, changer: () => void) {
        const assets = get(config.options.nest, 'compilerOptions.assets', []) as AssetEntry[];

        if (assets.length <= 0) {
            return;
        }

        try {
            const isWatchEnabled = toBoolean(get(config, 'watchAssets', 'src'));
            const filesToWatch = assets.map<AssetEntry>((item) => {
                if (typeof item === 'string') {
                    return {
                        glob: join(codePath, item),
                    };
                }
                return {
                    glob: join(codePath, item.include!),
                    exclude: item.exclude ? join(codePath, item.exclude) : undefined,
                    flat: item.flat, // deprecated field
                    watchAssets: item.watchAssets,
                };
            });

            for (const item of filesToWatch) {
                const option: ActionOnFile = {
                    action: 'change',
                    item,
                    path: '',
                    sourceRoot: codePath,
                    watchAssetsMode: isWatchEnabled,
                };

                const watcher = chokidar
                    .watch(item.glob, { ignored: item.exclude })
                    .on('add', (path: string) =>
                        this.actionOnFile({ ...option, path, action: 'change' }, changer),
                    )
                    .on('change', (path: string) =>
                        this.actionOnFile({ ...option, path, action: 'change' }, changer),
                    )
                    .on('unlink', (path: string) =>
                        this.actionOnFile({ ...option, path, action: 'unlink' }, changer),
                    );

                this.watchers.push(watcher);
            }
        } catch (err) {
            throw new Error(
                `An error occurred during the assets copying process. ${(err as any).message}`,
            );
        }
    }

    protected actionOnFile(option: ActionOnFile, changer: () => void) {
        const { action, item, path, watchAssetsMode } = option;
        const isWatchEnabled = watchAssetsMode || item.watchAssets;

        if (!isWatchEnabled && this.watchAssetsKeyValue[path]) {
            return;
        }
        this.watchAssetsKeyValue[path] = true;
        this.actionInProgress = true;

        if (action === 'change') changer();
    }
}
