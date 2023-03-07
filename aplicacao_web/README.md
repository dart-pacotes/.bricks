# aplicacao-web

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A very opiniated SvelteKit template that fits my own taste and workflow

## Features

These are the things you get if you use this template:

1. SvelteKit with TS, Prettier, ESLint support aliases, git client hooks, static files
2. Git Client hooks for linting + formatting validation
3. Support for static files
4. TailwindCSS + RippleUI + Class Level Theme
5. Support for l10n with `typesafe-i18n`
6. Deployment Adapter (either)

    6.1 - GitHub Pages (default)

    6.2 - Node (optional)

7. SEO support (favicon, meta elements)

## Usage

```bash
mason make aplicacao_web --name <application_name> --description <application_description> --author <application_author> --adapter <github-pages|node>
```