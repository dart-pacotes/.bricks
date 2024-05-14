import { describe, expect, test } from 'vitest';
import { isThemeSupported, type Theme } from '@presentation';

describe('theme', () => {
	describe('isThemeSupported', () => {
		test('returns true if value matches any of defined in union type', async () => {
			const values = ['dark', 'pastel', 'light'] satisfies Theme[];

			const result = values.map(isThemeSupported).reduceRight((p, c) => p && c);

			expect(result).toBeTruthy();
		});

		test('returns false if value does not match any of defined in union type', async () => {
			const values = ['dark', 'dark2'];

			const result = values.map(isThemeSupported).reduceRight((p, c) => p && c);

			expect(result).toBeFalsy();
		});
	});
});
