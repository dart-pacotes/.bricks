import { writable } from 'svelte/store';
import { getContext, setContext } from 'svelte';

const breakpointStoreContextKey = 'breakpoint-store';

/**
 * Supported TailwindCSS breakpoint literals.
 */
export type Breakpoint = 'sm' | 'md' | 'lg' | 'xl' | '2xl';

/**
 * Provides a breakpoint store to children components.
 */
export const provideBreakpointStore = () =>
	setContext(breakpointStoreContextKey, writable<Breakpoint>());

/**
 * Resolves the nearest breakpoint store.
 */
export const resolveBreakpointStore = () =>
	getContext<ReturnType<typeof provideBreakpointStore>>(breakpointStoreContextKey);
