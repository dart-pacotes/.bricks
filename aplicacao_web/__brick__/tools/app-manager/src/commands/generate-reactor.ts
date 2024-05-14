import {
	Command,
	CommandError,
	ExecutionError,
	InputValidationError
} from './type';
import input from '@inquirer/input';
import {
	Either,
	Left,
	Right,
	safeAsyncThrowCall
} from '@web-pacotes/foundation-types';
import { appendFileSync, existsSync, mkdirSync, writeFileSync } from 'fs';
import path from 'path';
import {
	ReactorBarrelTemplate,
	ReactorEventTemplate,
	ReactorStateTemplate,
	ReactorTemplate,
	ReactorsBarrelTemplate
} from '../templates';

export class GenerateReactorCommand implements Command {
	name = () => 'generate-command' as const;
	value = () => 'Generate reactor' as const;
	description = () =>
		'Automates the generation of initial reactor boilerplate' as const;

	async execute(): Promise<Either<CommandError, void>> {
		return safeAsyncThrowCall(
			async () => {
				const name = await input({ message: `What's the reactor name?` }).then(
					(n) => n.trimStart()
				);

				if (name.trim().length === 0) {
					return Left(InputValidationError('reactor name cannot be empty'));
				}

				const {
					reactorFolder,
					eventFilePath,
					reactorFilePath,
					reactorFolderPath,
					stateFilePath,
					reactorBarrelFilePath,
					reactorsBarrelFilePath,
					type
				} = this.paths(name);

				if (existsSync(reactorFolderPath)) {
					return Left(
						InputValidationError('a reactor with the same name already exists!')
					);
				}

				const writes = [
					() => mkdirSync(reactorFolderPath),
					() =>
						writeFileSync(eventFilePath, ReactorEventTemplate(type), 'utf8'),
					() =>
						writeFileSync(stateFilePath, ReactorStateTemplate(type), 'utf8'),
					() => writeFileSync(reactorFilePath, ReactorTemplate(type), 'utf8'),
					() =>
						writeFileSync(
							reactorBarrelFilePath,
							ReactorBarrelTemplate(),
							'utf8'
						),
					() =>
						appendFileSync(
							reactorsBarrelFilePath,
							ReactorsBarrelTemplate(reactorFolder),
							'utf8'
						)
				];

				writes.forEach((wc) => wc());

				return Right(undefined);
			},
			(error) => ExecutionError(error.message, error.stack)
		);
	}

	private paths(value: string) {
		const parts = value.split(' ');
		const type = parts
			.map((p) => `${p[0].toUpperCase()}${p.slice(1)}`)
			.join('');

		const reactorFolder = `${parts.join('-')}`.toLocaleLowerCase();

		const eventFile = 'event.ts';
		const stateFile = 'state.ts';
		const reactorFile = 'reactor.ts';

		const reactorsFolderPath = `${path.resolve()}/../../src/lib/reactors`;
		const reactorFolderPath = `${reactorsFolderPath}/${reactorFolder}`;

		const eventFilePath = `${reactorFolderPath}/${eventFile}`;
		const stateFilePath = `${reactorFolderPath}/${stateFile}`;
		const reactorFilePath = `${reactorFolderPath}/${reactorFile}`;

		const reactorsBarrelFilePath = `${reactorsFolderPath}/index.ts`;
		const reactorBarrelFilePath = `${reactorFolderPath}/index.ts`;

		return {
			reactorFolderPath,
			reactorFilePath,
			eventFilePath,
			stateFilePath,
			reactorsBarrelFilePath,
			reactorBarrelFilePath,
			reactorFolder,
			type
		};
	}
}
