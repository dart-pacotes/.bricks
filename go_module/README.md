# go_module

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A very opiniated golang module template that fits my own taste and workflow

## Features

These are the things you get if you use this template:

1. Clean and structured folder following the [conventions](https://github.com/palavrapasse/docs/blob/master/go/conventions.md)
2. Support for logging using [`aspirador`](https://github.com/palavrapasse/aspirador)
3. Support for build, share, and run with `docker`
4. Support for environment config with `env`
5. Linting with `golangci-lint`
6. Git Client hooks to enforce codestyle before pushing changes

## Usage

```bash
mason make go_module --name <package_name> --description <package_description> --author <package_author> --license <MIT|GNUGPLV3|none> --modulePath <golang_module_path>
```