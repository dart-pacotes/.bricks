# {{name}}

{{description}}

## Hooks

This repository is configured with client-side Git hooks which you need to install by running the following command:

```bash
./hooks/INSTALL
```

{{^isLibrary}}
## Usage
To properly run this {{#isWebService}}service{{/isWebService}}{{#isCli}}tool{{/isCli}}, you will need to a setup a `.env` file. Start by creating a copy of the `.env.tpl` file and fill the variables with values appropriate for the execution context.

{{^isOpenSource}}
When integrating this module on a different private module/project, you need to set the `GOPRIVATE` environment variable to let Go know how to resolve the module:

```
GOPRIVATE=....
```
{{/isOpenSource}}

{{#isWebService}}
Then, all you need to do is to run the service with the following command:

```bash
go run cmd/{{name}}/{{name}}.go
```
{{/isWebService}}

## Docker
{{^isOpenSource}}
To run the service with Docker, you will first need to setup the `.git-local-credentials` file. This credentials file shall contain the git credentials config to access private modules/projects.
{{/isOpenSource}}
To build the {{#isWebService}}service{{/isWebService}}{{#isCli}}tool{{/isCli}} image:

```bash
docker_tag={{name}}:latest

docker build \
    -f ./deployments/Dockerfile \
{{^isOpenSource}}
    --secret id=git-credentials,src=.local-git-credentials \
{{/isOpenSource}}
    . -t $docker_tag
```

{{#isCli}}
To run the tool container, for instance:

```bash
docker run {{name}} --help
```
{{/isCli}}
{{#isWebService}}
To run the service container:

```bash
export $(grep -v '^#' .env | xargs)

docker run \
    -p $server_port:$server_port \
    --mount "type=bind,src=$server_tls_crt_fp,dst=$server_tls_crt_fp" \
    --mount "type=bind,src=$server_tls_key_fp,dst=$server_tls_key_fp" \
    --mount "type=bind,src=$logging_fp,dst=$logging_fp" \
    --env-file .env \
    -t $docker_tag
```
{{/isWebService}}
{{/isLibrary}}

### Contact

This template was prepared by:

- João Freitas, @freitzzz
- Rute Santos, @rutesantos4

Contact us for freelancing work!