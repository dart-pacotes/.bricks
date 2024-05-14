import type { Todo } from '@models';
import { isTypedOf } from '@web-pacotes/reactor-svelte';

export const TodoInitial = (value: Todo[] = []) => {
	return {
		type: 'todo-initial' as const,
		value: value
	};
};

export const TodoUpdate = (value: Todo[]) => {
	return {
		type: 'todo-update' as const,
		value: value
	};
};

export const TodoFailure = (value: Todo[], reason: 'fetch' | 'update') => {
	return {
		type: 'todo-failure' as const,
		value: value,
		reason: reason
	};
};

export type TodoInitial = ReturnType<typeof TodoInitial>;
export type TodoUpdate = ReturnType<typeof TodoUpdate>;
export type TodoFailure = ReturnType<typeof TodoFailure>;
export type TodoState = { value: Todo[] } & (TodoInitial | TodoUpdate | TodoFailure);

export const isTodoFailure = (state: TodoState) => isTypedOf<TodoFailure>(state, 'todo-failure');
