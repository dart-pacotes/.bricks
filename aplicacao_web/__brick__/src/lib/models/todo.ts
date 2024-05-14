import { nanoid } from 'nanoid';

/**
 * Creates a new [Todo].
 *
 * @param value - the content of the todo.
 */
export function Todo(value: string) {
	return {
		id: nanoid(),
		value: value,
		done: false
	};
}

/**
 * Models a Todo type.
 */
export type Todo = ReturnType<typeof Todo>;
