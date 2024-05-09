# 0.1.6

- fix: set package type as module
- chore: replace swc with esbuild

# 0.1.5

- chore: manual bump

# 0.1.4

- fix: module entrypoint not pointing to ecmascript module

# 0.1.3

- Add support for keywords definition
- Fix example project not resolving dependencies for libraries on Windows
- Remove `.changeset` folder from standalone program bundle
- Fix `publish-docs` workflow not being triggered after package publish
- Git Client Hooks are now installed after brick generation
- Add bin program support for packages
- Automatically remove unused imports on lint
- Improve developers onboarding experience

# 0.1.2

- Cleanup `jest.config.ts`
- Fix Jest running tests outside of `src` directory (e.g., `bin`)
- Run `npm install` on example folder after package generation

# 0.1.1

- Fix `swc` only compiling `index.ts`
- Add support for typedocs
- Fix mason trying to render GitHub Actions Workflows variables
- Added support for publishing as an organization

# 0.1.0+1

- Release first version of `pacote-web`-
- Add support for:
    - Clean base Node.js project built entirely with TypeScript ES6
    - Support for hot-reloading and `swc` compilation
    - Support for tree-shaking using `esbuild`
    - Support for `CommonJS`, type declaration files (`.d.ts`) and source-maps
    - Linting and formatting with `ESLint` + `Prettier`
    - Git Client hooks to enforce codestyle before pushing changes
    - Unit testing with Jest
    - Support for package versioning with `changesets` + automatic publish with GitHub actions