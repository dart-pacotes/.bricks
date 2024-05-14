<!-- @component
Core component for rendering an asset image.
-->

<script lang="ts">
	import type { ImageSize } from './size';
	import type { ImageFormat } from './format';

	export let host: string;
	export let name: string;
	export let alt: string;
	export let size: ImageSize;
	export let format: ImageFormat;
</script>

{#if size === 'raw'}
	<img src="{host}/{format}/{name}.{format}" {alt} loading="lazy" />
{:else}
	<img src="{host}/{format}/{size}/{name}.{format}" {alt} loading="lazy" />
{/if}
