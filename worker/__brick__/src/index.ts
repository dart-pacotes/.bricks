import { Env, fromEnv } from "./config";

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
