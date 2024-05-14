import type { Breakpoint } from '@presentation';

/**
 * Asset sizes following the T-shirt sizing guidelines.
 */
type ShirtSize = 's' | 'm' | 'l' | 'xl' | '2xl';

/**
 * All image sizes accepted in assets usage.
 */
export type ImageSize = ShirtSize | 'raw';

/**
 * Converts a [Breakpoint] literal into a [ShirtSize] literal.
 *
 * @param value
 */
export const shirtSize = (value: Breakpoint): ShirtSize => {
	switch (value) {
		case 'sm':
			return 's';
		case 'md':
			return 'm';
		case 'lg':
			return 'l';
		case 'xl':
			return 'xl';
		case '2xl':
			return '2xl';
	}
};
