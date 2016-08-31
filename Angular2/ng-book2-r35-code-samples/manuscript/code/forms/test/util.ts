/*
 * Utility functions for our browser tests
 */
import { getDOM } from '@angular/platform-browser/src/dom/dom_adapter';

export function dispatchEvent(element: any, eventType: any) {
 getDOM().dispatchEvent(element, getDOM().createEvent(eventType));
}

export class ConsoleSpy {
  public logs: string[] = [];
  log(...args) {
    this.logs.push(args.join(' '));
  }
  warn(...args) {
    this.log(...args);
  }
}

