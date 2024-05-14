<!-- @component
Core component for rendering an asset image depending on the screen layout.
-->
<script lang="ts">
	import type { ImageFormat } from './format';
	import { shirtSize } from './size';
	import Image from './image.svelte';
	import { resolveBreakpointStore } from '@presentation';

	export let host: string;
	export let name: string;
	export let alt: string;
	export let format: ImageFormat;

	const breakpoint = resolveBreakpointStore();
</script>

<Image {host} {name} {alt} {format} size={shirtSize($breakpoint)} />
