import {
	type Either,
	type IOError,
	Left,
	ReadError,
	Right,
	safeThrowCall,
	WriteError
} from '@web-pacotes/foundation-types';
import type { BrowserStorage } from './storage';

/**
 * Implements a [BrowserStorage] for accessing the browser local storage.
 */
export class LocalBrowserStorage implements BrowserStorage<string> {
	private storage: Storage;

	constructor(window: Window) {
		this.storage = window.localStorage;
	}

	store(key: string, data: string): Promise<Either<IOError, string>> {
		return Promise.resolve(
			safeThrowCall(
				() => {
					this.storage.setItem(key, data);

					return Right(data);
				},
				(error) =>
					WriteError(
						`could not write to local storage: ${error.message}(${error.name})`,
						error.stack
					)
			) as Either<IOError, string>
		);
	}

	lookup(key: string): Promise<Either<IOError, string>> {
		return Promise.resolve(
			safeThrowCall(
				() => {
					const value = this.storage.getItem(key);

					if (value) {
						return Right(value);
					} else {
						return Left(ReadError(`no saved value for key: ${key}`));
					}
				},
				(error) => ReadError(`could not use local storage: ${error.message}`, error.stack)
			) as Either<IOError, string>
		);
	}

	exists(key: string): Promise<Either<IOError, boolean>> {
		return Promise.resolve(
			safeThrowCall(
				() => Right(typeof this.storage.getItem(key) === 'string'),
				(error) => ReadError(`could not use local storage: ${error.message}`, error.stack)
			) as Either<IOError, boolean>
		);
	}

	evict(key: string): Promise<Either<IOError, void>> {
		return Promise.resolve(
			safeThrowCall(
				() => {
					this.storage.removeItem(key);

					return Right(null);
				},
				(error) => WriteError(`could not use local storage: ${error.message}`, error.stack)
			) as Either<IOError, void>
		);
	}
}
