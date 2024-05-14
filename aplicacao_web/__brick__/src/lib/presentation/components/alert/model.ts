/**
 * Union of all kind of alerts that can be presented.
 */
type AlertType = 'info' | 'warning' | 'success' | 'error';

/**
 * The data required to prepare an alert component.
 */
export type Alert = {
	type: AlertType;
	title: string;
	message: string;
};
