<script lang="ts">
	import { Todo } from '@models';
	import { type CheckBoxItem, CheckList, WritingHand } from '../components';
	import { LL } from '@i18n';

	export let values: Todo[];
	export let onNewTodo: (todo: Todo) => void;
	export let onUpdateTodo: (todo: Todo) => void;
	export let onDeleteTodos: () => void;

	let newTodoInput: HTMLInputElement;

	$: checkListValues = values.map((t) => {
		return {
			id: t.id,
			value: t.value,
			active: t.done
		} satisfies CheckBoxItem;
	});

	$: completed = checkListValues.filter((x) => x.active);

	$: ll = $LL.todoList;
</script>

<div class="card overflow-y-auto">
	<div class="card-body break-all">
		<h2 class="card-header">TODO</h2>
		{#if checkListValues.length === 0}
			<div id="empty-todo-list" class="flex flex-col items-center">
				<div class="w-32">
					<WritingHand />
				</div>
				<p>{ll.empty()}</p>
			</div>
		{/if}
		<input
			bind:this={newTodoInput}
			id="new-todo-input"
			class="input"
			type="text"
			placeholder={ll.new()}
			on:keypress={(event) => {
				if (event.key === 'Enter') {
					onNewTodo(Todo(newTodoInput.value));

					newTodoInput.value = '';
				}
			}}
		/>
		<CheckList
			values={checkListValues}
			onChanged={(value) => {
				const todo = values.find((x) => x.id === value.id);

				if (todo) {
					todo.done = value.active;
					todo.value = value.value;

					onUpdateTodo(todo);
				}
			}}
		/>
		<div class="flex justify-center">
			<button
				id="delete-completed-todos"
				class="btn btn-primary w-fit"
				disabled={completed.length === 0}
				on:click={() => {
					onDeleteTodos();
				}}
			>
				{ll.delete()}
			</button>
		</div>
		<h3 class="card-footer justify-end text-sm italic">
			<span>{ll.updated()} ({new Date().toLocaleTimeString()})</span>
		</h3>
	</div>
</div>
