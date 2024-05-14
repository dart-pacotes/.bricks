import { isTodoFailure, type AlertsReactor, type TodoState, ShowErrorAlert } from '@reactors';
import { logMessage } from '@web-pacotes/lumberdash';
import type { TranslationFunctions } from '@i18n';

export const onTodoStateChanged = (
	state: TodoState,
	alerts: AlertsReactor,
	ll: TranslationFunctions['todoList']
) => {
	logMessage(`new state: ${state.type}`);

	if (isTodoFailure(state)) {
		alerts.add(ShowErrorAlert(ll.alerts.updateFailure.title(), ll.alerts.updateFailure.message()));
	}
};
