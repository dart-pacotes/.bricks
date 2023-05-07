{{#isLibrary}}
export { default } from './sum';
{{/isLibrary}}

{{^isLibrary}}
import sum from './sum';

console.log(sum(40, 2));
{{/isLibrary}}