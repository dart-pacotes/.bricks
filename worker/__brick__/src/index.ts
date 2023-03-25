import { Env, fromEnv } from "./config";

{{#isFetchWorker}}
export default {
	async fetch(
		request: Request,
		env: Env,
		ctx: ExecutionContext
	): Promise<Response> {
		const config = fromEnv(env);

		return new Response(`Hello ${config.awesomeSecret}!`);
	},
};
{{/isFetchWorker}}

{{^isFetchWorker}}
export default {
	async scheduled(
		controller: ScheduledController,
		env: Env,
		ctx: ExecutionContext
	): Promise<void> {
		const config = fromEnv(env);

		console.info(`Hello ${config.awesomeSecret}!`);

		return Promise.resolve();
	},
};
{{/isFetchWorker}}