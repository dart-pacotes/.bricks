import { selectors, test, expect } from '@playwright/test';

test('updates todo list after writing todo and pressing enter', async ({ page }) => {
	selectors.setTestIdAttribute('id');

	await page.goto('/');

	const todo = 'publish v2!';
	const input = page.getByTestId('new-todo-input');

	await input.fill(todo);
	await input.press('Enter');

	const result = page.getByText(todo);

	await expect(result.isVisible()).resolves.toBeTruthy();
});
