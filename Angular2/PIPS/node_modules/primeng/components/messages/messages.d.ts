import { Message } from '../common/api';
export declare class Messages {
    value: Message[];
    closable: boolean;
    hasMessages(): boolean;
    getSeverityClass(): string;
    clear(event: any): void;
}
export declare class MessagesModule {
}
