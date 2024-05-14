<!-- @component
Component for rendering a static asset image based on the screen layout.
-->
<script lang="ts">
	import type { ImageFormat } from '../format';
	import ResponsiveImage from '../responsive-image.svelte';
	import { base } from '$app/paths';

	export let name: string;
	export let alt: string;
	export let format: ImageFormat;

	const host = base;
</script>

<ResponsiveImage {host} {name} {alt} {format} />
