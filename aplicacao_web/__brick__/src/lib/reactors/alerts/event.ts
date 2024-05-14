import type { Alert } from '@presentation';

export function ShowInfoAlert(title: string, message: string) {
	return {
		title: title,
		message: message,
		type: 'show-info-alert' as const
	};
}

export function ShowWarningAlert(title: string, message: string) {
	return {
		title: title,
		message: message,
		type: 'show-warning-alert' as const
	};
}

export function ShowSuccessAlert(title: string, message: string) {
	return {
		title: title,
		message: message,
		type: 'show-success-alert' as const
	};
}

export function ShowErrorAlert(title: string, message: string) {
	return {
		title: title,
		message: message,
		type: 'show-eeventToTyperror-alert' as const
	};
}

export type ShowInfoAlert = ReturnType<typeof ShowInfoAlert>;
export type ShowWarningAlert = ReturnType<typeof ShowWarningAlert>;
export type ShowSuccessAlert = ReturnType<typeof ShowSuccessAlert>;
export type ShowErrorAlert = ReturnType<typeof ShowErrorAlert>;

export type AlertEvent = ShowInfoAlert | ShowWarningAlert | ShowSuccessAlert | ShowErrorAlert;

export const toAlertType = (event: AlertEvent): Pick<Alert, 'type'>['type'] => {
	switch (event.type) {
		case 'show-info-alert':
			return 'info';
		case 'show-warning-alert':
			return 'warning';
		case 'show-success-alert':
			return 'success';
		default:
			return 'error';
	}
};
