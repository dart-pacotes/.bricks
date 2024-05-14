import type { BaseTranslation } from '../i18n-types';

const en = {
	todoList: {
		empty: "Nothing here yet! What's on your mind?",
		new: 'New todo...',
		delete: 'Delete completed',
		updated: 'Updated',
		alerts: {
			updateFailure: {
				title: 'Update failure',
				message: "Couldn't update the last todo"
			}
		}
	},
	asdf: {
		title: 'You have found out a secret page...',
		description:
			"There isn't any cool here, but you can star this project on GitHub... It helps a ton!",
		actions: {
			visit: 'Absolutely! :)'
		}
	}
} satisfies BaseTranslation;

export default en;
