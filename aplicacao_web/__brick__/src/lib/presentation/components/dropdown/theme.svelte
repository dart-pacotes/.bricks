<script lang="ts">
	import { isThemeSupported, resolveThemeStore, type Theme } from '../util';
	import { Flower, Moon, Sun } from '../icons';

	const store = resolveThemeStore();

	const icons = {
		dark: Moon,
		light: Sun,
		pastel: Flower
	} satisfies Record<Theme, typeof Moon>;

	const id = 'theme-dropdown';

	export let alignment: 'right' | 'bottom' = 'right';
</script>

<div class="dropdown">
	<div class="mt-2 cursor-pointer" tabindex="-1">
		{#if $store === 'dark'}
			<div class="fill-white">
				<svelte:component this={icons[$store]} />
			</div>
		{:else}
			<svelte:component this={icons[$store]} />
		{/if}
	</div>
	<div
		{id}
		class="dropdown-menu {alignment === 'right'
			? 'dropdown-menu-bottom-left'
			: 'dropdown-menu-top-center'}"
	>
		<div class="btn-group btn-group-scrollable overflow-x-hidden">
			{#each Object.entries(icons) as [theme, icon]}
				<button
					class="btn {$store === theme ? 'btn-active' : ''}"
					on:click={() => isThemeSupported(theme) && store.set(theme)}
				>
					<svelte:component this={icon} />
				</button>
			{/each}
		</div>
	</div>
</div>
