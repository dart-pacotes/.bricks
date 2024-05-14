import type { Storage } from '@data';

/**
 * Marks a [Storage] interface for browser storages, where the output is always a string.
 */
export type BrowserStorage<I> = Storage<I, string>;
