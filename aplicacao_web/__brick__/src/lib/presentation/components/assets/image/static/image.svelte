<!-- @component
Component for rendering a static asset image.
-->

<script lang="ts">
	import type { ImageSize } from '../size';
	import type { ImageFormat } from '../format';
	import Image from '../image.svelte';
	import { base } from '$app/paths';

	export let name: string;
	export let alt: string;
	export let size: ImageSize;
	export let format: ImageFormat;

	const host = base;
</script>

<Image {host} {name} {alt} {size} {format} />
