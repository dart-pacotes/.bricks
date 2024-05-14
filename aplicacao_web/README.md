# aplicacao-web

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A very opiniated SvelteKit template that fits my own taste and workflow

## Features

These are the things you get if you use this template:

1. Built around [Reactor](https://github.com/web-pacotes/reactor) state manager (very inspired from Flutter Bloc)
2. Clean separation of concerns in multiple layers (components > reactors > repositories > networking clients)
3. Guarded with Monads + other FP best practices
4. Painless Dependency Injection
5. Unit tests (with vitest + coverage report)
6. Component tests (with vitest + coverage report)
7. E2E Tests (using Playwright)
8. Light + Dark + Any other theme customization 
9. Server-side Routing
10. TailwindCSS + Tailwind framework ([Ripple UI](https://www.ripple-ui.com/))
12. Out of the box localization system (uses `navigator.language` on browser and `accepts-language` header on server)
13. Out of the box client alert components/logic
14. Out of the box logging on client + server side
15. Out of the box linting + formatting (with eslint)
16. Git Client-side hooks for formatting before pushing
17. GitHub Action Workflow for verifying project state (linting + tests)
18. Favicon + SEO
19. CLI tool to configure app architecture + other configurations

## Usage

```bash
mason make aplicacao_web --name <application_name> --description <application_description> --author <application_author> --adapter <github-pages|node>
```