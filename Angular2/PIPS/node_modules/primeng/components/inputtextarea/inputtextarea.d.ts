import { ElementRef, OnInit } from '@angular/core';
export declare class InputTextarea implements OnInit {
    protected el: ElementRef;
    autoResize: boolean;
    rows: number;
    cols: number;
    hover: boolean;
    focus: boolean;
    rowsDefault: number;
    colsDefault: number;
    constructor(el: ElementRef);
    ngOnInit(): void;
    onMouseover(e: any): void;
    onMouseout(e: any): void;
    onFocus(e: any): void;
    onBlur(e: any): void;
    isDisabled(): any;
    onKeyup(e: any): void;
    resize(): void;
}
export declare class InputTextareaModule {
}
