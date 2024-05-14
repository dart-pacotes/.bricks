<!-- @component
Provider component for a svelte store of [Theme].
-->
<script lang="ts">
	import { onMount } from 'svelte';
	import { isThemeSupported, provideThemeStore } from './theme';

	const store = provideThemeStore();

	onMount(() => {
		const rootEl = document.documentElement;

		let theme = rootEl.getAttribute('data-theme') ?? $store;

		if (!$store && isThemeSupported(theme)) {
			store.set(theme);
		}

		store.subscribe((theme) => {
			rootEl.setAttribute('data-theme', theme);
		});
	});
</script>

<slot />
