import type { FormattersInitializer } from 'typesafe-i18n';
import type { Locales, Formatters } from './i18n-types';

/* eslint-disable @typescript-eslint/no-unused-vars */
export const initFormatters: FormattersInitializer<Locales, Formatters> = (locale: Locales) => {
	const formatters: Formatters = {
		date: dateFormatter
	};

	return formatters;
};

export function dateFormatter(date: Date): string {
	return date.toLocaleDateString();
}
