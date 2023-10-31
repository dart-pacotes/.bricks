# {{name.lowerCase().paramCase()}}

{{description}}

{{#isLibrary}}
![npm version](https://badgen.net/npm/v/{{#isOrganization}}@{{author}}/{{/isOrganization}}{{name.lowerCase().paramCase()}}) ![npm total downloads](https://badgen.net/npm/dt/{{#isOrganization}}@{{author}}/{{/isOrganization}}{{name.lowerCase().paramCase()}}) ![bundlephobia bundle size](https://badgen.net/bundlephobia/min/{{#isOrganization}}@{{author}}/{{/isOrganization}}{{name.lowerCase().paramCase()}})

---

## How to use

todo: describe usage

```typescript
todo: include usage code here
```

{{#generateBin}}
Additionally, you can {{description.lowerCase()}}. Execute the following command for more info:

```bash
{{name.lowerCase().paramCase()}} --help
```
{{/generateBin}}

## Features

todo: enumerate features package currently provides

### Upcoming features

todo: enumerate features package does not provide

---
{{/isLibrary}}

{{#isLibrary}}
## Bugs and Contributions

Found any bug (including typos) in the package? Do you have any suggestion 
or feature to include for future releases? Please create an issue via 
GitHub in order to track each contribution. Also, pull requests are very 
welcome!
{{/isLibrary}}

To contribute, start by setting up your local development environment. The [setup.md](setup.md) document will onboard you on how to do so!

## Contact

This template was prepared by:

- João Freitas, @freitzzz
- Rute Santos, @rutesantos4

Contact us for freelancing work!