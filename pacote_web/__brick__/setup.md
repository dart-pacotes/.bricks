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
{{#isLibrary}}(cd example; npm i){{/isLibrary}}
```

If everything finished successfully, you're ready to start hacking around! The table below will onboard you on the available commands to use.

|Script|Description|
|------|-----------|
|`npm run build|transpile and bundle files in `.cjs`, `.js`, `.d.ts` and respective source-maps|
|`npm run start|run the project with `swc` compilation|
{{#withHotReload}}
|`npm run start:hot|run the project with hot-reload enabled|
{{/withHotReload}}
|`npm run test|run the unit tests|
|`npm run lint|analyze and lint the project|
|`npm run format|format the project based on lint feedback|
|`npm run docs|generate docs site|
|`npm run docs:publish|generate docs site and publish it to GitHub Pages|
{{#isLibrary}}
|`npm run release|create the temporary changesets file|
|`npm run publish|publish the package to NPM|
{{/isLibrary}}

{{#isLibrary}}

## Automatically Publishing to NPM

To automatically publish the package to NPM, you will need to grab a token of the publisher account for CI usage, and set it as a repository secret in GitHub under the `NPM_TOKEN` identifier.
{{/isLibrary}}