import select from '@inquirer/select';
import { Command, GenerateReactorCommand } from './commands';
import { fold, runAsyncCatching } from '@web-pacotes/foundation-types';

async function main() {
	console.info(`Welcome! I'm your app companion, what can I do for you?`);

	const commands = [new GenerateReactorCommand()] satisfies Command[];

	const answer = await select({
		message: 'Select an option',
		choices: [
			...commands.map((cmd) => {
				return {
					name: cmd.name(),
					value: cmd.value(),
					description: cmd.description()
				};
			})
		]
	});

	const command = commands.find((cmd) => cmd.value() === answer)!;

	return command.execute();
}

runAsyncCatching(main).then((result) => {
	fold(
		result,
		(l) => console.error(`An unexpected error occurred: ${l.cause}`),
		(r) => {
			fold(
				r,
				(ll) => console.error(`Error: ${ll.cause}`),
				(_) => console.info(`Bye bye!`)
			);
		}
	);
});
