<script>
	import '../app.css';
	import { vault } from '@core';
	import { MultiReactorProvider } from '@web-pacotes/reactor-svelte';
	import { AlertsReactor, TodoFetched, TodoReactor } from '@reactors';
	import { browser } from '$app/environment';
	import {
		BreakpointProvider,
		GlobalThemeDropdown,
		ThemeProvider,
		ToastGroup
	} from '@presentation';
	import { onMount } from 'svelte';

	const appVault = vault(browser ? window.window : undefined);

	const todos = new TodoReactor(appVault.todosRepository);
	const alerts = new AlertsReactor();

	todos.add(TodoFetched());

	$: mounted = false;

	onMount(() => (mounted = true));
</script>

<BreakpointProvider>
	<ThemeProvider>
		<MultiReactorProvider reactors={[todos, alerts]}>
			{#if mounted}
				<slot />
			{/if}

			<GlobalThemeDropdown />
			<ToastGroup values={$alerts.value} />
		</MultiReactorProvider>
	</ThemeProvider>
</BreakpointProvider>
