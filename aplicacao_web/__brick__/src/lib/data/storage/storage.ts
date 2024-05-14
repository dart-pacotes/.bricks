import type { Either, IOError } from '@web-pacotes/foundation-types';

/**
 * A general purpose interface for accessing a data storage. The generic types [I] and [O] mark
 * the input and output types of the storage.
 */
export interface Storage<I, O> {
	store(key: string, data: I): Promise<Either<IOError, O>>;

	lookup(key: string): Promise<Either<IOError, O>>;

	exists(key: string): Promise<Either<IOError, boolean>>;

	evict(key: string): Promise<Either<IOError, void>>;
}
