import { EmojiLumberdashClient } from '@web-pacotes/lumberdash';

/**
 * A [LumberdashClient] to be registered under a server environment.
 */
export class ServerLumberdashClient extends EmojiLumberdashClient {}

/**
 * A [LumberdashClient] to be registered under a browser environment.
 */
export class BrowserLumberdashClient extends EmojiLumberdashClient {}
