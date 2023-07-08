#!/usr/bin/env node

import { parseArgs } from 'util';

import pkg from '../dist/index.js';

const handler = pkg.default;

var args = process.argv.slice(2);

// fail safe
if (args.length === 0 || args.find((arg) => arg.match(/--?h(elp){0,1}/g))) {
    args = ['-h', 'true'];
}

const options = {
    help: {
        type: 'string',
        short: 'h',
        description: 'Displays available commands'
    },
    left: {
        type: 'string',
        short: 'x',
        description: 'Left operand'
    },
    right: {
        type: 'string',
        short: 'y',
        description: 'right operand'
    },
};

const { values } = parseArgs({ args, options });

if (values.help) {
    console.log(
        `{{name.lowerCase().paramCase()}}: {{description.lowerCase()}}, directly from your command line.`
    );

    Object.entries(options).forEach(([k, v]) =>
        console.log(`  --${k}: ${v.description}`)
    );

    process.exit(0);
}

const x = parseFloat(values.left);
const y = parseFloat(values.right);

const sum = handler(x, y);

console.info(`the sum of ${x} with ${y} is ${sum}`);