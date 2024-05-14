<script lang="ts">
	import ThemeDropdown from './theme.svelte';
	import { resolveBreakpointStore } from '../util';

	const breakpoint = resolveBreakpointStore();
</script>

{#if $breakpoint}
	{#if $breakpoint === 'sm'}
		<div class="fixed bottom-4 right-1/2 flex flex-col gap-2">
			<ThemeDropdown alignment="bottom" />
		</div>
	{:else}
		<div class="fixed right-8 top-2 flex flex-col gap-2">
			<ThemeDropdown alignment="right" />
		</div>
	{/if}
{/if}
