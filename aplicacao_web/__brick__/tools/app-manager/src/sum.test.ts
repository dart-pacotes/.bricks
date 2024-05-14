import { expect, test } from '@jest/globals';
import sum from './sum';

test('adding 40 with 2 equals 42', () => {
	expect(sum(40, 2)).toBe(42);
});
