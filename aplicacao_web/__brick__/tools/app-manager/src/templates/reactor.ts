export const ReactorEventTemplate = (name: string) => {
	const event = `${name}Event`;
	const started = `${name}Started`;
	const startedType = `${name.toLocaleLowerCase()}-started`;

	return `
    import { isTypedOf } from "@web-pacotes/reactor-svelte";

    export function ${started}() {
        return {
            type: '${startedType}' as const
        };
    }

    export type ${started} = ReturnType<typeof ${started}>;
    export type ${event} = ${started};

    export const is${started} = (event: ${event}) => isTypedOf<${started}>(event, '${startedType}');
    `;
};

export const ReactorStateTemplate = (name: string) => {
	const state = `${name}State`;
	const initial = `${name}Initial`;
	const initialType = `${name.toLocaleLowerCase()}-initial`;

	const progress = `${name}InProgress`;
	const progressType = `${name.toLocaleLowerCase()}-progress`;

	const success = `${name}Success`;
	const successType = `${name.toLocaleLowerCase()}-success`;

	const failure = `${name}Failure`;
	const failureType = `${name.toLocaleLowerCase()}-failure`;

	return `
    import { isTypedOf } from "@web-pacotes/reactor-svelte";

    export function ${initial}() {
        return {
            type: '${initialType}' as const
        };
    }

    export function ${progress}() {
        return {
            type: '${progressType}' as const
        };
    }

    export function ${success}() {
        return {
            type: '${successType}' as const
        };
    }

    export function ${failure}() {
        return {
            type: '${failureType}' as const
        };
    }

    export type ${initial} = ReturnType<typeof ${initial}>;
    export type ${progress} = ReturnType<typeof ${progress}>;
    export type ${success} = ReturnType<typeof ${success}>;
    export type ${failure} = ReturnType<typeof ${failure}>;
    export type ${state} = ${initial}|${progress}|${failure}|${success};

    export const is${initial} = (event: ${state}) => isTypedOf<${initial}>(event, '${initialType}');
    export const is${progress} = (event: ${state}) => isTypedOf<${progress}>(event, '${progressType}');
    export const is${success} = (event: ${state}) => isTypedOf<${success}>(event, '${successType}');
    export const is${failure} = (event: ${state}) => isTypedOf<${failure}>(event, '${failureType}');
    `;
};

export const ReactorTemplate = (name: string) => {
	const event = `${name}Event`;
	const state = `${name}State`;

	const started = `${name}Started`;

	const initial = `${name}Initial`;
	const progress = `${name}InProgress`;
	const success = `${name}Success`;
	const failure = `${name}Failure`;

	return `
    import { Reactor } from '@web-pacotes/reactor-svelte';
    import {
        is${started},
        type ${event},
        type ${started}
    } from './event';
    import { ${initial}, type ${state}, ${progress}, ${success}, ${failure}  } from './state';
    
    /**
     * A reactor that manages the state of ${name.toLocaleLowerCase()} actions.
     */
    export class ${name}Reactor extends Reactor<${event}, ${state}> {
        constructor() {
            super(${initial}());
    
            this.on<${started}>((event, emit) => {
                emit(${progress}());

                setTimeout(() => {
                    if(Math.random() < 0.5) {
                        emit(${success}());
                    } else {
                        emit(${failure}());
                    }
				}, 500)
            }, is${started});
        }
    }
    `;
};

export const ReactorBarrelTemplate = () => {
	return `
    export * from './event';
    export * from './reactor';
    export * from './state';
    `;
};

export const ReactorsBarrelTemplate = (folder: string) => {
	return `export * from './${folder}';`;
};
