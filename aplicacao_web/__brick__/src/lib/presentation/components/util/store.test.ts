import { afterAll, beforeEach, describe, expect, test, vitest } from 'vitest';
import { storable } from '@presentation';
import { get } from 'svelte/store';
import * as environment from '$app/environment';

describe('storable', () => {
	const key = 'data.key';
	const data = 'data';

	const localStorage = {} as Storage;

	vitest.spyOn(window, 'localStorage', 'get').mockReturnValue(localStorage);

	beforeEach(() => {
		vitest.spyOn(environment, 'browser', 'get').mockReturnValue(true);
		localStorage.setItem = vitest.fn();
	});

	afterAll(() => {
		vitest.clearAllMocks();
	});

	test('only sets initial value if local storage getItem does not return a value', async () => {
		localStorage.getItem = vitest.fn().mockReturnValue(undefined);

		const store = storable(key, data);
		const result = get(store);

		expect(result).toBe(data);
	});

	test('does not set initial value if local storage getItem returns a value', async () => {
		localStorage.getItem = vitest.fn().mockReturnValue(data);

		const store = storable(key, `not ${data}`);
		const result = get(store);

		expect(result).toBe(data);
	});

	test('does not set any value if local storage getItem does not return a value and there is not initial value', async () => {
		localStorage.getItem = vitest.fn().mockReturnValue(undefined);

		storable(key);

		expect(localStorage.setItem).not.toBeCalled();
	});
});
