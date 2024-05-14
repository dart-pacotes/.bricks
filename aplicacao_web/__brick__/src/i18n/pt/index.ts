import type { Translation } from '../i18n-types';

const pt = {
	todoList: {
		empty: 'Ainda nada aqui! O que está na tua mente?',
		new: 'Novo todo...',
		delete: 'Eliminar já completados',
		updated: 'Atualizado',
		alerts: {
			updateFailure: {
				title: 'Falha na Atualização',
				message: 'Não foi possível atualizar o ultímo todo'
			}
		}
	},
	asdf: {
		title: 'Encontraste uma página secreta...',
		description: 'Mas não existe nada fixe aqui... Contudo podes dar star a este projeto no GitHub',
		actions: {
			visit: 'Obrigado! :)'
		}
	}
} satisfies Translation;

export default pt;
