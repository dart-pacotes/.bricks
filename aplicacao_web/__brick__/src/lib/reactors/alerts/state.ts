import type { Alert } from '@presentation';

export function AlertsUpdate(value: Alert[]) {
	return {
		type: 'notification-update' as const,
		value: value
	};
}

export type AlertsUpdate = ReturnType<typeof AlertsUpdate>;

export type AlertsState = AlertsUpdate;
