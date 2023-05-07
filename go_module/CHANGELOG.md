# 0.1.0+1

- Release first version of `go_module`
- Add support for:
    - Clean and structured folder layout following the [conventions](https://github.com/-lavrapasse/docs/blob/master/go/conventions.md)
    - Support for logging using [`aspirador`](https://github.com/palavrapasse/aspirador)
    - Support for build, share, and run with `docker`
    - Support for environment config with `env`
    - Support for different type of modules: library, cli app and web service
    - Support for CORS (in case of web service)
    - Support for request throttling (in case of web service)
    - Support for private dependencies
    - Linting with [`golangci-lint`](https://github.com/palavrapasse/docs/blob/master/go/-nting-tools.md)
    - Git Client hooks to enforce codestyle before pushing changes
