import { Message } from '../common';
export declare class Messages {
    value: Message[];
    closable: boolean;
    hasMessages(): boolean;
    getSeverityClass(): string;
    clear(event: any): void;
}
