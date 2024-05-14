import { detectLocale, loadLocaleAsync, setLocale } from '@i18n';
import type { PageServerLoad } from './$types';
import { initAcceptLanguageHeaderDetector } from 'typesafe-i18n/detectors';

export const load = (async (request) => {
	const locale = detectLocale(initAcceptLanguageHeaderDetector(request.request));

	await loadLocaleAsync(locale);

	setLocale(locale);
}) satisfies PageServerLoad;
