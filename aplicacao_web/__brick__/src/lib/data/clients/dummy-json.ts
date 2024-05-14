import { type FetchClient, NetworkingClient } from '@web-pacotes/networking';

/**
 * A [NetworkingClient] for accessing [DummyJson API](https://dummyjson.com).
 */
export class DummyJsonNetworkingClient extends NetworkingClient {
	constructor(client: FetchClient) {
		super({
			fetchClient: client,
			baseUrl: new URL('https://dummyjson.com/')
		});
	}
}
