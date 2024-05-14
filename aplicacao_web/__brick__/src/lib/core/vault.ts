import {
	BrowserStorageTodosRepository,
	FakeTodosRepository,
	LocalBrowserStorage,
	type TodosRepository
} from '@data';

/**
 * A container registry for application dependencies.
 */
interface Vault {
	todosRepository: TodosRepository;
}

/**
 * Creates a [Vault] depending on the application environment.
 *
 * @param window - the window object if running on the browser.
 */
export function vault(window?: Window) {
	if (!window) {
		return {
			todosRepository: new FakeTodosRepository()
		} satisfies Vault;
	} else {
		const browserStorage = new LocalBrowserStorage(window);
		return {
			todosRepository: new BrowserStorageTodosRepository(browserStorage)
		} satisfies Vault;
	}
}
