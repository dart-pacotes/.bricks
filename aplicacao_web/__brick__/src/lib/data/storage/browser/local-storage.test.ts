import { afterAll, describe, expect, test, vitest } from 'vitest';
import { LocalBrowserStorage } from '@data';
import { Left, ReadError, Right, WriteError } from '@web-pacotes/foundation-types';

describe('local-browser-storage', () => {
	const key = 'data.key';
	const data = 'data';

	const localStorage = {} as Storage;
	const window = { localStorage: localStorage } as Window;

	afterAll(() => {
		vitest.clearAllMocks();
	});

	describe('store', () => {
		test('returns right hand with input data if setItem does not throw', async () => {
			const storage = new LocalBrowserStorage(window);
			localStorage.setItem = vitest.fn();

			const result = storage.store(key, data);

			expect(result).resolves.toEqual(Right(data));
		});

		test('returns left hand with write error if setItem throws', async () => {
			const storage = new LocalBrowserStorage(window);
			localStorage.setItem = vitest.fn().mockImplementation(() => {
				throw 'operation not allowed';
			});

			const result = storage.store(key, data);

			expect(result).resolves.toEqual(Left(WriteError(expect.anything(), expect.anything())));
		});
	});

	describe('lookup', () => {
		test('returns right hand with output data if getItem returns a value', async () => {
			const storage = new LocalBrowserStorage(window);
			localStorage.getItem = vitest.fn().mockReturnValue(data);

			const result = storage.lookup(key);

			expect(result).resolves.toEqual(Right(data));
		});

		test('returns left hand with read error if getItem does not return a value', async () => {
			const storage = new LocalBrowserStorage(window);
			localStorage.getItem = vitest.fn().mockReturnValue(undefined);

			const result = storage.lookup(key);

			expect(result).resolves.toEqual(Left(ReadError(expect.anything())));
		});

		test('returns left hand with read error if getItem throws', async () => {
			const storage = new LocalBrowserStorage(window);
			localStorage.getItem = vitest.fn().mockImplementation(() => {
				throw 'operation not allowed';
			});

			const result = storage.lookup(key);

			expect(result).resolves.toEqual(Left(ReadError(expect.anything(), expect.anything())));
		});
	});

	describe('exists', () => {
		test('returns right hand with truthy value if getItem returns a value', async () => {
			const storage = new LocalBrowserStorage(window);
			localStorage.getItem = vitest.fn().mockReturnValue(data);

			const result = storage.exists(key);

			expect(result).resolves.toEqual(Right(true));
		});

		test('returns right hand with falsy value if getItem does not return a value', async () => {
			const storage = new LocalBrowserStorage(window);
			localStorage.getItem = vitest.fn().mockReturnValue(undefined);

			const result = storage.exists(key);

			expect(result).resolves.toEqual(Right(false));
		});

		test('returns left hand with read error if getItem throws', async () => {
			const storage = new LocalBrowserStorage(window);
			localStorage.getItem = vitest.fn().mockImplementation(() => {
				throw 'operation not allowed';
			});

			const result = storage.exists(key);

			expect(result).resolves.toEqual(Left(ReadError(expect.anything(), expect.anything())));
		});
	});

	describe('evict', () => {
		test('returns right hand with null value if removeItem does not throw', async () => {
			const storage = new LocalBrowserStorage(window);
			localStorage.removeItem = vitest.fn();

			const result = storage.evict(key);

			expect(result).resolves.toEqual(Right(null));
		});

		test('returns left hand with write error if removeItem throws', async () => {
			const storage = new LocalBrowserStorage(window);
			localStorage.removeItem = vitest.fn().mockImplementation(() => {
				throw 'operation not allowed';
			});

			const result = storage.evict(key);

			expect(result).resolves.toEqual(Left(WriteError(expect.anything(), expect.anything())));
		});
	});
});
