# go_module

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A very opiniated golang module template that fits my own taste and workflow

## Features

These are the things you get if you use this template:

1. Clean and structured folder layout following the [conventions](https://github.com/palavrapasse/docs/blob/master/go/conventions.md)
2. Support for logging using [`aspirador`](https://github.com/palavrapasse/aspirador)
3. Support for build, share, and run with `docker`
4. Support for environment config with `env`
5. Support for different type of modules: library, cli app and web service
6. Support for CORS (in case of web service)
7. Support for request throttling (in case of web service)
8. Support for private dependencies
9. Linting with [`golangci-lint`](https://github.com/palavrapasse/docs/blob/master/go/linting-tools.md)
10. Git Client hooks to enforce codestyle before pushing changes

## Usage

```bash
mason make go_module --name <package_name> --description <package_description> --author <package_author> --type <library|cli|webService> --license <MIT|GNUGPLV3|none> --modulePath <golang_module_path> --dependabot <true|false> --openSource <true|false>
```