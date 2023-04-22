# pacote_web

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A very opiniated TypeScript Node package template that fits my own taste and workflow

## Features

These are the things you get if you use this template:

1. Clean base Node.js project built entirely with TypeScript ES6
2. Support for hot-reloading and `swc` compilation
3. Support for tree-shaking using `esbuild`
4. Support for `CommonJS`, type declaration files (`.d.ts`) and source-maps
5. Linting and formatting with `ESLint` + `Prettier`
6. Git Client hooks to enforce codestyle before pushing changes
7. Unit testing with Jest
8. Support for package versioning with `changesets` + automatic publish with GitHub actions

## Usage

```bash
mason make pacote_web --name <package_name> --description <package_description> --author <package_author> --type <standalone|library> --hotreload <true|false> --license <MIT|GNUGPLV3|none>
```