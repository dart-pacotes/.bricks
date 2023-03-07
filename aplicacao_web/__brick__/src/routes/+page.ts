import { detectLocale, loadLocaleAsync, setLocale } from '@i18n';

export const load = (async () => {
    const locale = detectLocale();

    await loadLocaleAsync(locale);

    setLocale(locale);
}) satisfies PageLoad;