# {{name.lowerCase().paramCase()}}

{{description}}

{{#isLibrary}}
![npm version](https://badgen.net/npm/v/{{name.lowerCase().paramCase()}}) ![npm total downloads](https://badgen.net/npm/dt/{{name.lowerCase().paramCase()}}) ![bundlephobia bundle size](https://badgen.net/bundlephobia/min/{{name.lowerCase().paramCase()}})

---

## How to use

todo: describe usage

```typescript
todo: include usage code here
```

## Features

todo: enumerate features package currently provides

## Missing features

todo: enumerate features package does not provide

---
{{/isLibrary}}

## Scripts

- `npm run build` to transpile and bundle files in `.cjs`, `.js`, `.d.ts` and respective source-maps
- `npm run start` to run the project with `swc` compilation
{{#withHotReload}}
- `npm run start:hot` to run the project with hot-reload enabled
{{/withHotReload}}
- `npm run test` to run the unit tests
- `npm run lint` to analyze and lint the project
- `npm run format` to format the project based on lint feedback
{{#isLibrary}}
- `npm run release` to create the temporary changesets file
- `npm run publish` to publish the package to NPM
{{/isLibrary}}

## Hooks

This repository is configured with client-side Git hooks that automatically format + lint the codebase before each push. You can install it by running the following command:

```bash
./hooks/INSTALL
```

{{#isLibrary}}
## Automatically Publishing to NPM

To automatically publish the package to NPM, you will need to grab a token of the publisher account for CI usage, and set it as a repository secret in GitHub under the `NPM_TOKEN` identifier.
{{/isLibrary}}

---

{{#isLibrary}}
### Bugs and Contributions

Found any bug (including typos) in the package? Do you have any suggestion 
or feature to include for future releases? Please create an issue via 
GitHub in order to track each contribution. Also, pull requests are very 
welcome!
{{/isLibrary}}

### Contact

This template was prepared by:

- João Freitas, @freitzzz
- Rute Santos, @rutesantos4

Contact us for freelancing work!