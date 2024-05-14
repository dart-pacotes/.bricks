<script lang="ts">
	import { TodoList } from '@presentation';
	import { AlertsReactor, TodoCreated, TodoReactor, TodosDeleted, TodoUpdated } from '@reactors';
	import { ReactorListener, resolve } from '@web-pacotes/reactor-svelte';
	import { onTodoStateChanged } from './page-listeners';
	import { LL } from '@i18n';

	const todos = resolve(TodoReactor);
	const alerts = resolve(AlertsReactor);

	$: ll = $LL.todoList;
</script>

<section class="m-4 h-1/3">
	<div class="flex max-h-full justify-center overflow-hidden">
		<ReactorListener reactor={todos} listener={(state) => onTodoStateChanged(state, alerts, ll)}>
			<TodoList
				values={$todos.value}
				onNewTodo={(value) => todos.add(TodoCreated(value))}
				onUpdateTodo={(value) => todos.add(TodoUpdated(value))}
				onDeleteTodos={() => todos.add(TodosDeleted())}
			/>
		</ReactorListener>
	</div>
</section>
