<!-- @component
Provider component for a svelte store of [Breakpoint].
-->
<script lang="ts">
	import { onMount } from 'svelte';
	import { provideBreakpointStore } from './breakpoint';

	let el: HTMLDivElement;

	const store = provideBreakpointStore();

	onMount(() => {
		/* Compute pixels to rem: https://stackoverflow.com/a/42769683 */
		const px2rem = (px: number) =>
			px / parseFloat(getComputedStyle(document.documentElement).fontSize);

		const resizeObserver = new ResizeObserver((entries) => {
			if (entries.length > 0) {
				const { width } = entries[0].contentRect;
				const rem = px2rem(width);

				switch (rem) {
					case 0.0:
						store.set('sm');
						break;
					case 0.25:
						store.set('md');
						break;
					case 0.5:
						store.set('lg');
						break;
					case 0.75:
						store.set('xl');
						break;
					case 1.0:
					default:
						store.set('2xl');
						break;
				}
			}
		});

		resizeObserver.observe(el);
	});
</script>

<div
	bind:this={el}
	class="max-2xl:size-4 max-xl:size-3 max-lg:size-2 max-md:size-1 max-sm:size-0"
/>

<slot />
