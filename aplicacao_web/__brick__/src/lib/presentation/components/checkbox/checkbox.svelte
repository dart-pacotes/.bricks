<script lang="ts">
	import type { CheckBoxItem } from './model';

	export let value: CheckBoxItem;
	export let onChanged: (value: CheckBoxItem) => void;
</script>

<div>
	<label class="flex cursor-pointer gap-2">
		<input
			type="checkbox"
			class="checkbox"
			checked={value.active}
			on:input={(_) => {
				value.active = !value.active;

				onChanged(value);
			}}
		/>
		<span>{value.value}</span>
	</label>
</div>
