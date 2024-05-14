import { Todo } from '@models';
import {
	type Either,
	fold,
	type IOError,
	Left,
	Right,
	type TypedError,
	UnknownError
} from '@web-pacotes/foundation-types';
import { logMessage } from '@web-pacotes/lumberdash';
import type { BrowserStorage } from '@data';

/**
 * A repository for managing todos.
 */
export interface TodosRepository {
	add(todo: Todo): Promise<Either<TypedError, Todo[]>>;

	all(): Promise<Either<TypedError, Todo[]>>;

	update(todo: Todo): Promise<Either<TypedError, Todo[]>>;

	delete(todos: Todo[]): Promise<Either<TypedError, Todo[]>>;
}

/**
 * An [TodosRepository] implementation for debug purposes only.
 */
export class FakeTodosRepository implements TodosRepository {
	private cache = new Array<Todo>(...[Todo('Star .bricks repository'), Todo('Finish v2')]);

	add(todo: Todo): Promise<Either<TypedError, Todo[]>> {
		this.cache.push(todo);

		return Promise.resolve(Right(this.cache));
	}

	all(): Promise<Either<TypedError, Todo[]>> {
		return Promise.resolve(Right(this.cache));
	}

	update(todo: Todo): Promise<Either<TypedError, Todo[]>> {
		const cachedIdx = this.cache.findIndex((x) => x.id === todo.id);

		if (cachedIdx < 0) {
			return Promise.resolve(Left(UnknownError('updated todo is not present on cache')));
		}

		this.cache[cachedIdx] = todo;

		return Promise.resolve(Right(this.cache));
	}

	delete(todos: Todo[]): Promise<Either<TypedError, Todo[]>> {
		this.cache = this.cache.filter((x) => todos.find((y) => x.id === y.id) === undefined);

		return Promise.resolve(Right(this.cache));
	}
}

/**
 * A [TodosRepository] implementation that uses a [BrowserStorage] as the database for saving and
 * retrieving todos.
 */
export class BrowserStorageTodosRepository implements TodosRepository {
	private readonly storage: BrowserStorage<string>;
	private readonly cache = new Array<Todo>();

	constructor(storage: BrowserStorage<string>) {
		this.storage = storage;
		this.cache = new Array<Todo>();
	}

	async add(todo: Todo): Promise<Either<TypedError, Todo[]>> {
		this.cache.push(todo);

		return this.updateStorage(this.cache, () => {
			this.cache.pop();
		});
	}

	async all(): Promise<Either<TypedError, Todo[]>> {
		if (this.cache.length > 0) {
			return Right(this.cache);
		}

		const result = await this.storage.lookup('todos');

		return fold<IOError, string, Either<TypedError, Todo[]>>(
			result,
			(l) => {
				this.cache.pop();

				return Left(l);
			},
			(r: string) => {
				this.cache.push(...JSON.parse(r));

				return Right(this.cache);
			}
		);
	}

	async update(todo: Todo): Promise<Either<TypedError, Todo[]>> {
		const cachedIdx = this.cache.findIndex((x) => x.id === todo.id);

		if (cachedIdx < 0) {
			return Promise.resolve(Left(UnknownError('updated todo is not present on cache')));
		}

		const cacheTodo = this.cache[cachedIdx];
		this.cache[cachedIdx] = todo;

		return this.updateStorage(this.cache, () => {
			this.cache[cachedIdx] = cacheTodo;
		});
	}

	async delete(todos: Todo[]): Promise<Either<TypedError, Todo[]>> {
		const cache = [...this.cache];
		const remaining = cache.filter((x) => todos.find((y) => x.id === y.id) === undefined);

		this.cache.length = 0;
		this.cache.push(...remaining);

		return this.updateStorage(this.cache, () => {
			this.cache.length = 0;
			this.cache.push(...cache);
		});
	}

	private async updateStorage(todos: Todo[], onError: () => void) {
		const result = await this.storage.store('todos', JSON.stringify(todos));

		return fold<IOError, string, Either<TypedError, Todo[]>>(
			result,
			(l) => {
				onError();

				return Left(l);
			},
			(r: string) => {
				logMessage(`updated todos in browser storage: (written ${r.length} bytes)`);

				return Right(todos);
			}
		);
	}
}
