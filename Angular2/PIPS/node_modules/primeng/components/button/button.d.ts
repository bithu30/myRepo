import { ElementRef, AfterViewInit, OnDestroy } from '@angular/core';
import { DomHandler } from '../dom/domhandler';
export declare class Button implements AfterViewInit, OnDestroy {
    protected el: ElementRef;
    protected domHandler: DomHandler;
    icon: string;
    iconPos: string;
    protected _label: string;
    protected hover: boolean;
    protected focus: boolean;
    protected active: boolean;
    protected initialized: boolean;
    constructor(el: ElementRef, domHandler: DomHandler);
    ngAfterViewInit(): void;
    onMouseenter(e: any): void;
    onMouseleave(e: any): void;
    onMouseDown(e: any): void;
    onMouseUp(e: any): void;
    onFocus(e: any): void;
    onBlur(e: any): void;
    isDisabled(): any;
    getStyleClass(): string;
    label: string;
    ngOnDestroy(): void;
}
export declare class ButtonModule {
}
