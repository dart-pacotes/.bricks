import {
	isTodoCreated,
	isTodoFetched,
	isTodosDeleted,
	isTodoUpdated,
	TodoCreated,
	type TodoEvent,
	type TodoFetched,
	type TodosDeleted,
	type TodoUpdated
} from './event';
import { TodoInitial, type TodoState, TodoUpdate, TodoFailure } from './state';
import { logError, logMessage } from '@web-pacotes/lumberdash';
import type { TodosRepository } from '@data';
import { Reactor } from '@web-pacotes/reactor-svelte';
import { fold, wrap } from '@web-pacotes/foundation-types';

/**
 * A reactor that manages the state of todo actions.
 */
export class TodoReactor extends Reactor<TodoEvent, TodoState> {
	constructor(repository: TodosRepository) {
		super(TodoInitial([]));

		this.on<TodoCreated>(async (event, emit) => {
			const todo = event.value;

			logMessage(`Received new todo: ${todo.value}`);

			if (todo.value.trim().length > 0) {
				const result = await repository.add(todo);

				emit(
					fold(
						result,
						(l) => {
							logError(wrap(l));

							return TodoFailure(this.state.value, 'update') as TodoState;
						},
						(r) => TodoUpdate(r)
					)
				);
			}
		}, isTodoCreated);

		this.on<TodoFetched>(async (_, emit) => {
			logMessage(`Fetching all todos...`);

			const result = await repository.all();

			emit(
				fold(
					result,
					(l) => {
						logError(wrap(l));

						return TodoFailure(this.state.value, 'fetch') as TodoState;
					},
					(r) => TodoUpdate(r)
				)
			);
		}, isTodoFetched);

		this.on<TodoUpdated>(async (event, emit) => {
			logMessage(`Updating todo... ${event.value}`);

			const result = await repository.update(event.value);

			emit(
				fold(
					result,
					(l) => {
						logError(wrap(l));

						return TodoFailure(this.state.value, 'update') as TodoState;
					},
					(r) => TodoUpdate(r)
				)
			);
		}, isTodoUpdated);

		this.on<TodosDeleted>(async (_, emit) => {
			logMessage(`Deleting todos...`);

			const completedTodos = this.state.value.filter((x) => x.done);
			const result = await repository.delete(completedTodos);

			emit(
				fold(
					result,
					(l) => {
						logError(wrap(l));

						return TodoFailure(this.state.value, 'update') as TodoState;
					},
					(r) => TodoUpdate(r)
				)
			);
		}, isTodosDeleted);
	}
}
