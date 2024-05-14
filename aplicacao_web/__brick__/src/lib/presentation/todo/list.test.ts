import { afterEach, describe, expect, test, vitest } from 'vitest';
import { Todo } from '@models';
import { TodoList } from '@presentation';
import { cleanup, configure, fireEvent, render } from '@testing-library/svelte';

describe('todo-list', () => {
	const onNewTodo = vitest.fn();
	const onUpdateTodo = vitest.fn();
	const onDeleteTodos = vitest.fn();

	configure({
		testIdAttribute: 'id'
	});

	afterEach(() => {
		cleanup();
		vitest.clearAllMocks();
	});

	describe('states', () => {
		test('builds writing hand illustration if list is empty', () => {
			const id = 'empty-todo-list';
			const values = [] satisfies Todo[];

			const result = render(TodoList, {
				props: {
					values: values,
					onNewTodo: onNewTodo,
					onUpdateTodo: onUpdateTodo,
					onDeleteTodos: onDeleteTodos
				}
			});

			const el = result.findByTestId(id);

			expect(el).resolves.toBeDefined();
		});

		test('does not build writing hand illustration if list contains todos', () => {
			const id = 'empty-todo-list';
			const values = [Todo('publish v2!')] satisfies Todo[];

			const result = render(TodoList, {
				props: {
					values: values,
					onNewTodo: onNewTodo,
					onUpdateTodo: onUpdateTodo,
					onDeleteTodos: onDeleteTodos
				}
			});

			const el = result.findByTestId(id);

			expect(el).rejects.toBeDefined();
		});

		test('completed button is disabled if no todo is checked', async () => {
			const id = 'delete-completed-todos';
			const todo = Todo('publish v2!');
			const values = [todo] satisfies Todo[];

			const result = render(TodoList, {
				props: {
					values: values,
					onNewTodo: onNewTodo,
					onUpdateTodo: onUpdateTodo,
					onDeleteTodos: onDeleteTodos
				}
			});

			const el = await result.findByTestId(id);

			expect(el.attributes).toHaveProperty('disabled');
		});

		test('completed button is not disabled if any todo is checked', async () => {
			const id = 'delete-completed-todos';
			const todo = Todo('publish v2!');
			todo.done = true;

			const values = [todo] satisfies Todo[];

			const result = render(TodoList, {
				props: {
					values: values,
					onNewTodo: onNewTodo,
					onUpdateTodo: onUpdateTodo,
					onDeleteTodos: onDeleteTodos
				}
			});

			const el = await result.findByTestId(id);

			expect(el.attributes).not.toHaveProperty('disabled');
		});
	});

	describe('actions', () => {
		test('dispatches onNewTodo callback if enter key is tapped when todo input is focused', async () => {
			const id = 'new-todo-input';
			const values = [] satisfies Todo[];

			const result = render(TodoList, {
				props: {
					values: values,
					onNewTodo: onNewTodo,
					onUpdateTodo: onUpdateTodo,
					onDeleteTodos: onDeleteTodos
				}
			});

			const el = await result.findByTestId(id);
			await fireEvent.keyPress(el, { key: 'Enter' });

			expect(onNewTodo).toBeCalled();
		});

		test('dispatches onUpdateTodo callback if todo is checked', async () => {
			const todo = Todo('publish v2!');
			const values = [todo] satisfies Todo[];

			const result = render(TodoList, {
				props: {
					values: values,
					onNewTodo: onNewTodo,
					onUpdateTodo: onUpdateTodo,
					onDeleteTodos: onDeleteTodos
				}
			});

			const el = await result.findByText(todo.value);
			el.click();

			expect(onUpdateTodo).toBeCalled();
		});

		test('dispatches onDeleteTodos callback if completed button is clicked', async () => {
			const id = 'delete-completed-todos';
			const todo = Todo('publish v2!');
			todo.done = true;

			const values = [todo] satisfies Todo[];

			const result = render(TodoList, {
				props: {
					values: values,
					onNewTodo: onNewTodo,
					onUpdateTodo: onUpdateTodo,
					onDeleteTodos: onDeleteTodos
				}
			});

			const el = await result.findByTestId(id);
			el.click();

			expect(onDeleteTodos).toBeCalled();
		});
	});
});
