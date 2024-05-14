# {{name.lowerCase().paramCase()}}

A Svelte-Kit app powered by a multi-layered architecture with reactive state management on top of stores.

This project can be generated with few other options on https://github.com/dart-pacotes/.bricks

## Features

- Built around [Reactor](https://github.com/web-pacotes/reactor) state manager (very inspired from Flutter Bloc)
- Clean separation of concerns in multiple layers (components > reactors > repositories > networking clients)
- Guarded with Monads + other FP best practices
- Painless Dependency Injection ([Vault](src/lib/core/vault.ts))
- Unit tests (with vitest + coverage report)
- Component tests (with vitest + coverage report)
- E2E Tests (using Playwright)
- Light + Dark + Any other theme customization ([theme](src/lib/presentation/components/util/theme/))
- Server-side Routing
- TailwindCSS + Tailwind framework ([Ripple UI](https://www.ripple-ui.com/))
- T-Shirt sized asset images system ([assets](src/lib/presentation/components/assets/))
- Out of the box localization system ([typesafe-i18n](src/i18n/))
- Out of the box client alert components/logic
- Out of the box logging on client + server side ([hooks](src))
- Out of the box linting + formatting (with eslint)
- Git Client-side hooks for formatting before pushing
- GitHub Action Workflow for verifying project state (linting + tests)
- Favicon + SEO
- CLI tool to configure app architecture + other configurations ([app-manager](tools/app-manager/))

### Upcoming features

- GitHub Action Workflow to automate deployment process
- Automatic management of assets + favicon through app-manager

## Demo

todo: embed video that quickly previews app

The app is also live at: https://...

---

## Bugs and Contributions

Found any bug (including typos) in the app? Do you have any suggestion
or feature to include for future releases? Please create an issue via
GitHub in order to track each contribution. Also, pull requests are very
welcome!

To contribute, start by setting up your local development environment. The [setup.md](setup.md) document will onboard you on how to do so!

## Contact

This template was prepared by:

- João Freitas, @freitzzz
- Rute Santos, @rutesantos4

Contact us for freelancing work!
