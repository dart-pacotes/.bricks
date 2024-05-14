import { afterAll, beforeAll, describe, expect, test, vitest } from 'vitest';
import { AlertsReactor, AlertsUpdate, ShowInfoAlert } from '@reactors';

describe('alerts-reactor', () => {
	beforeAll(() => {
		vitest.useFakeTimers();
	});

	afterAll(() => {
		vitest.clearAllTimers();
	});

	test('removes last emitted alert after 3500 milliseconds', async () => {
		const reactor = new AlertsReactor();
		const event = ShowInfoAlert('hey', 'this message will disappear after 3500 milliseconds');

		reactor.add(event);

		expect(reactor.state).toEqual(
			AlertsUpdate([{ type: 'info', title: event.title, message: event.message }])
		);

		vitest.advanceTimersByTime(3500);

		expect(reactor.state).toEqual(AlertsUpdate([]));
	});
});
