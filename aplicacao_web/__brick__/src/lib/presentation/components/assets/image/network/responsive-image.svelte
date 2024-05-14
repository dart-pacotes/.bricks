<!-- @component
Component for rendering a network asset image based on the screen layout.
-->
<script lang="ts">
	import type { ImageFormat } from '../format';
	import ResponsiveImage from '../responsive-image.svelte';

	export let host: string;
	export let name: string;
	export let alt: string;
	export let format: ImageFormat;
</script>

<ResponsiveImage {host} {name} {alt} {format} />
