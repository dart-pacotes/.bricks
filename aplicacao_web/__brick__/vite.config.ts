import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vitest/config';

export default defineConfig({
	plugins: [sveltekit()],
	test: {
		include: ['src/**/*.{test,spec}.{js,ts}'],
		environment: 'jsdom',
		// Required to load real onMount implementation
		// https://github.com/vitest-dev/vitest/issues/2834#issuecomment-1439576110
		alias: [{ find: /^svelte$/, replacement: 'svelte/internal' }],
		coverage: {
			provider: 'v8',
			reporter: ['lcov'],
			include: ['src/lib/**']
		}
	}
});
