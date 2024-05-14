import { Either, TypedError } from '@web-pacotes/foundation-types';

export interface Command {
	name(): string;

	value(): string;

	description(): string;

	execute(): Promise<Either<CommandError, void>>;
}

export const InputValidationError = (cause: string, stack?: string) =>
	TypedError('input-validation-error', cause, stack);
export const ExecutionError = (cause: string, stack?: string) =>
	TypedError('execution-error', cause, stack);

export type CommandError =
	| ReturnType<typeof InputValidationError>
	| ReturnType<typeof ExecutionError>;
