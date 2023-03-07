# {{name.lowerCase().paramCase()}}

{{description}}

## Hooks

This repository is configured with client-side Git hooks that automatically format + lint the codebase before each push. You can install it by running the following command:

```bash
./hooks/INSTALL
```

## Development

Once you've created a project and installed dependencies with `npm install`, start a development server:

```bash
npm run dev
```

Also, to update the localization files, you will need to run the following command before editing each locale files:

```bash
npm run typesafe-i18n
```

## Building

To create a production version of your app:

```bash
npm run build
```

You can preview the production build with `npm run preview`.

## Deploy

To deploy your app:

```bash
npm run deploy
```

{{#useNodeAdapter}}
---

Alternatively, you can deploy your app within a Docker container. First, build the image:

```bash
docker_tag={{name.lowerCase().paramCase()}}:latest
docker build -f ./Dockerfile . -t $docker_tag
```

Then, spawn a container:

```bash
docker run -p 3000:3000 -t $docker_tag
```

{{/useNodeAdapter}}

### Contact

This template was prepared by:

- João Freitas, @freitzzz
- Rute Santos, @rutesantos4

Contact us for freelancing work!