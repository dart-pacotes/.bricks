<script lang="ts">
	import { Checkbox, type CheckBoxItem } from '../checkbox';

	export let values: CheckBoxItem[];
	export let onChanged: (value: CheckBoxItem) => void;
</script>

<div class="flex flex-col">
	{#each values as value}
		<Checkbox bind:value bind:onChanged />
	{/each}
</div>
