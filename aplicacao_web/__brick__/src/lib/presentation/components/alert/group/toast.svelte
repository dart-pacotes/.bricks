<script lang="ts">
	import { type Alert, Toast } from '..';

	export let values: Alert[];
</script>

<div class="fixed right-2 top-2 flex flex-col gap-2">
	{#each values as value}
		<Toast {value} />
	{/each}
</div>
