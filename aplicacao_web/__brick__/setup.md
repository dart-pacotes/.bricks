# setup

To contribute to this project or build everything locally, start by cloning the repository:

```bash
git clone https://github.com/{{author}}/{{name.lowerCase().paramCase()}}
```

Afterwards, install the client-side Git hooks to automatically format and lint the project before pushing new commits.

```bash
./hooks/INSTALL
```

To finish, install all the dependencies the project requires to be built.

```bash
npm i
```

If everything finished successfully, you're ready to start hacking around! The table below will onboard you on the
available commands to use.

| Script                  | Description                                        |
| ----------------------- | -------------------------------------------------- |
| `npm run dev`           | start the development server                       |
| `npm run preview`       | start production app server                        |
| `npm run check`         | validates and syncs svelte-kit configuration files |
| `npm run typesafe-i18n` | update localization files                          |
| `npm run lint`          | analyze and lint the project                       |
| `npm run format`        | format the project based on lint feedback          |
| `npm run manager`       | runs app manager tool                              |
| `npm run build`         | build app in production environment                |
| `npm run test`          | runs unit + component tests                        |
| `npm run test:coverage` | runs unit + component tests and coverage report    |
| `npm run test:e2e`      | runs e2e tests                                     |
{{#useGitHubPagesAdapter}}|`npm run deploy`|deploys built app to GitHub Pages|{{/useGitHubPagesAdapter}}

{{#useNodeAdapter}}

## Docker

To ship the app in a Docker container, you must first build the app:

```bash
docker_tag={{name.lowerCase().paramCase()}}:latest
docker build -f ./Dockerfile . -t $docker_tag
```

Then, spawn a container:

```bash
docker run -p 3000:3000 -t $docker_tag
```

{{/useNodeAdapter}}