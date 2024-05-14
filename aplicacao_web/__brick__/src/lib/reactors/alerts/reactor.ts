import { Reactor } from '@web-pacotes/reactor-svelte';
import { toAlertType, type AlertEvent } from './event';
import { AlertsUpdate, type AlertsState } from './state';
import type { Alert } from '@presentation';

/**
 * A reactor for managing in-app alerts.
 */
export class AlertsReactor extends Reactor<AlertEvent, AlertsState> {
	constructor() {
		super(AlertsUpdate([]));

		super.on<AlertEvent>(
			(event, emit) => {
				const alert = {
					title: event.title,
					message: event.message,
					type: toAlertType(event)
				} satisfies Alert;

				emit(AlertsUpdate([alert, ...this.state.value]));

				setTimeout(() => emit(AlertsUpdate([...this.state.value.filter((x) => x != alert)])), 3500);
			},
			(event) => event !== undefined
		);
	}
}
