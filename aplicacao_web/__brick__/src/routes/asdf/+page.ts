import { detectLocale, loadLocaleAsync, setLocale } from '@i18n';
import type { PageLoad } from './$types';
import { navigatorDetector } from 'typesafe-i18n/detectors';
import { browser } from '$app/environment';

export const load = (async () => {
	const locale = browser ? detectLocale(navigatorDetector) : detectLocale();

	await loadLocaleAsync(locale);

	setLocale(locale);
}) satisfies PageLoad;
