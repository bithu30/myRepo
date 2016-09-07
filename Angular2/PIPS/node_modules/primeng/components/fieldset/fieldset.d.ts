import { EventEmitter } from '@angular/core';
export declare class Fieldset {
    legend: string;
    toggleable: boolean;
    collapsed: boolean;
    onBeforeToggle: EventEmitter<any>;
    onAfterToggle: EventEmitter<any>;
    style: any;
    styleClass: string;
    protected hover: boolean;
    protected animating: boolean;
    onLegendMouseenter(event: any): void;
    onLegendMouseleave(event: any): void;
    toggle(event: any): void;
    expand(event: any): void;
    collapse(event: any): void;
}
export declare class FieldsetModule {
}
