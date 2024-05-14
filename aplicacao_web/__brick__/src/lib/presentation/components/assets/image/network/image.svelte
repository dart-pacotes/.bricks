<!-- @component
Component for rendering a network asset image.
-->

<script lang="ts">
	import type { ImageSize } from '../size';
	import type { ImageFormat } from '../format';
	import Image from '../image.svelte';

	export let host: string;
	export let name: string;
	export let alt: string;
	export let size: ImageSize;
	export let format: ImageFormat;
</script>

<Image {host} {name} {alt} {size} {format} />
