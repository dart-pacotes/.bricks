import type { Todo } from '@models';
import { isTypedOf } from '@web-pacotes/reactor-svelte';

export function TodoCreated(value: Todo) {
	return {
		type: 'todo-created' as const,
		value: value
	};
}

export function TodoFetched() {
	return {
		type: 'todo-fetched' as const
	};
}

export function TodoUpdated(value: Todo) {
	return {
		type: 'todo-updated' as const,
		value: value
	};
}

export function TodosDeleted() {
	return {
		type: 'todos-deleted' as const
	};
}

export type TodoCreated = ReturnType<typeof TodoCreated>;
export type TodoFetched = ReturnType<typeof TodoFetched>;
export type TodoUpdated = ReturnType<typeof TodoUpdated>;
export type TodosDeleted = ReturnType<typeof TodosDeleted>;
export type TodoEvent = TodoCreated | TodoFetched | TodosDeleted | TodoUpdated;

export const isTodoCreated = (event: TodoEvent) => isTypedOf<TodoCreated>(event, 'todo-created');
export const isTodoFetched = (event: TodoEvent) => isTypedOf<TodoFetched>(event, 'todo-fetched');
export const isTodoUpdated = (event: TodoEvent) => isTypedOf<TodoUpdated>(event, 'todo-updated');
export const isTodosDeleted = (event: TodoEvent) => isTypedOf<TodosDeleted>(event, 'todos-deleted');
