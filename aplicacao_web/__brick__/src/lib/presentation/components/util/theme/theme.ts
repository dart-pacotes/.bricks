import { getContext, setContext } from 'svelte';
import { storable } from '../store';

const themeStoreContextKey = 'theme-store';

/**
 * Supported TailwindCSS breakpoint literals.
 */
export type Theme = 'light' | 'dark' | 'pastel';

/**
 * Provides a theme store to children components.
 */
export const provideThemeStore = () =>
	setContext(themeStoreContextKey, storable<Theme>(themeStoreContextKey, 'dark'));

/**
 * Resolves the nearest theme store.
 */
export const resolveThemeStore = () =>
	getContext<ReturnType<typeof provideThemeStore>>(themeStoreContextKey);

/**
 * Type-guard predicate that validates if a theme is supported.
 *
 * @param theme - the dynamic theme to validate if it's supported
 */
export const isThemeSupported = (theme: string): theme is Theme => {
	switch (theme) {
		case 'light':
		case 'dark':
		case 'pastel':
			return true;
		default:
			return false;
	}
};
