import { expect, test } from '@jest/globals';
import { sum } from './index';

test('adding 40 with 2 equals 42', () => {
	expect(sum(40, 2)).toBe(42);
});
