import { writable } from 'svelte/store';
import { browser } from '$app/environment';

/**
 * A [writable] that uses the browser local storage to synchronize state.
 *
 * @param key - the key used to identify the saved state on the local storage.
 * @param value - the initial value of the store, if any.
 */
export const storable = <T extends string>(key: string, value?: T) => {
	const store = writable<T>();

	if (browser) {
		const stored = window.localStorage.getItem(key) ?? value;

		if (stored) {
			store.set(stored as T);
		}

		store.subscribe((value) => {
			if (value) {
				window.localStorage.setItem(key, value);
			}
		});
	}

	return store;
};
