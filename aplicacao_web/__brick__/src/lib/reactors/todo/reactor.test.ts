import { afterAll, beforeAll, describe, expect, test, vitest } from 'vitest';
import {
	TodoCreated,
	TodoFailure,
	TodoFetched,
	TodoReactor,
	TodosDeleted,
	TodoUpdate,
	TodoUpdated
} from '@reactors';
import type { TodosRepository } from '@data';
import { Todo } from '@models';
import { Left, Right, WriteError } from '@web-pacotes/foundation-types';

describe('todo-reactor', () => {
	const repository = {} as TodosRepository;

	beforeAll(() => {
		repository.add = vitest.fn().mockReturnValue([]);
		repository.all = vitest.fn().mockReturnValue([]);

		vitest.useFakeTimers();
	});

	afterAll(() => {
		vitest.clearAllMocks();
		vitest.clearAllTimers();
	});

	describe('todo-created', () => {
		test('rejects any todo which value is empty', () => {
			const reactor = new TodoReactor(repository);
			const events = [
				TodoCreated(Todo('')),
				TodoCreated(Todo('	')),
				TodoCreated(Todo('    ')),
				TodoCreated(Todo('						'))
			];

			events.forEach((e) => reactor.add(e));

			expect(repository.add).not.toBeCalled();
		});

		test('accepts todo which value is not empty', async () => {
			const reactor = new TodoReactor(repository);
			const event = TodoCreated(Todo('publish v2!'));

			reactor.add(event);
			await vitest.runAllTimersAsync();

			expect(repository.add).toBeCalled();
		});

		test('emits todo failure if repository fails to add todo', async () => {
			const reactor = new TodoReactor(repository);
			const event = TodoCreated(Todo('publish v2!'));
			repository.add = vitest.fn().mockReturnValue(Left(WriteError('failed to add todo')));

			reactor.add(event);
			await vitest.runAllTimersAsync();

			expect(reactor.state).toEqual(TodoFailure([], 'update'));
		});

		test('emits todo update if repository does not fail to add todo', async () => {
			const reactor = new TodoReactor(repository);
			const todo = Todo('publish v2!');
			const event = TodoCreated(todo);
			repository.add = vitest.fn().mockReturnValue(Right([todo]));

			reactor.add(event);
			await vitest.runAllTimersAsync();

			expect(reactor.state).toEqual(TodoUpdate([todo]));
		});
	});

	describe('todo-fetched', () => {
		test('emits todo failure if repository fails to retrieve all todos', async () => {
			const reactor = new TodoReactor(repository);
			const event = TodoFetched();
			repository.all = vitest.fn().mockReturnValue(Left(WriteError('failed to fetch todos')));

			reactor.add(event);
			await vitest.runAllTimersAsync();

			expect(reactor.state).toEqual(TodoFailure([], 'fetch'));
		});

		test('emits todo update if repository does not fail to fetch todos', async () => {
			const reactor = new TodoReactor(repository);
			const todo = Todo('publish v2!');
			const event = TodoFetched();
			repository.all = vitest.fn().mockReturnValue(Right([todo]));

			reactor.add(event);
			await vitest.runAllTimersAsync();

			expect(reactor.state).toEqual(TodoUpdate([todo]));
		});
	});

	describe('todo-updated', () => {
		test('emits todo failure if repository fails to update todo', async () => {
			const reactor = new TodoReactor(repository);
			const todo = Todo('publish v3!');
			const event = TodoUpdated(todo);
			repository.update = vitest.fn().mockReturnValue(Left(WriteError('failed to update todo')));

			reactor.add(event);
			await vitest.runAllTimersAsync();

			expect(reactor.state).toEqual(TodoFailure([], 'update'));
		});

		test('emits todo update if repository does not fail to update todo', async () => {
			const reactor = new TodoReactor(repository);
			const todo = Todo('publish v3!');
			const event = TodoUpdated(todo);
			repository.update = vitest.fn().mockReturnValue(Right([todo]));

			reactor.add(event);
			await vitest.runAllTimersAsync();

			expect(reactor.state).toEqual(TodoUpdate([todo]));
		});
	});

	describe('todos-deleted', () => {
		test('calls repository delete call with only the todos that are marked as done', async () => {
			const reactor = new TodoReactor(repository);
			const event = TodosDeleted();
			repository.delete = vitest.fn().mockReturnValue([]);

			const todosDone = [
				Todo('publish v2'),
				Todo('publish v3'),
				Todo('publish v4')
			] satisfies Todo[];
			const todosNotDone = [Todo('publish v5')] satisfies Todo[];
			const todos = [...todosDone, ...todosNotDone];

			todosDone.forEach((t) => (t.done = true));
			reactor.state.value = todos;

			reactor.add(event);
			await vitest.runAllTimersAsync();

			expect(repository.delete).toHaveBeenCalledWith(todosDone);
		});

		test('emits todo failure if repository fails to delete todos', async () => {
			const reactor = new TodoReactor(repository);
			const event = TodosDeleted();
			repository.delete = vitest.fn().mockReturnValue(Left(WriteError('failed to delete todos')));

			reactor.add(event);
			await vitest.runAllTimersAsync();

			expect(reactor.state).toEqual(TodoFailure([], 'update'));
		});

		test('emits todo update if repository does not fail to delete todos', async () => {
			const reactor = new TodoReactor(repository);
			const event = TodosDeleted();
			repository.delete = vitest.fn().mockReturnValue(Right([]));

			reactor.add(event);
			await vitest.runAllTimersAsync();

			expect(reactor.state).toEqual(TodoUpdate([]));
		});
	});
});
