import { ElementRef, EventEmitter } from '@angular/core';
import { DomHandler } from '../dom/domhandler';
export declare class Draggable {
    protected el: ElementRef;
    protected domHandler: DomHandler;
    scope: string;
    dragEffect: string;
    dragHandle: string;
    onDragStart: EventEmitter<any>;
    onDragEnd: EventEmitter<any>;
    onDrag: EventEmitter<any>;
    protected handle: any;
    constructor(el: ElementRef, domHandler: DomHandler);
    dragStart(event: any): void;
    drag(event: any): void;
    dragEnd(event: any): void;
    mouseover(event: any): void;
    mouseleave(event: any): void;
    allowDrag(): boolean;
}
export declare class Droppable {
    protected el: ElementRef;
    protected domHandler: DomHandler;
    scope: string;
    dropEffect: string;
    onDragEnter: EventEmitter<any>;
    onDragLeave: EventEmitter<any>;
    onDrop: EventEmitter<any>;
    onDragOver: EventEmitter<any>;
    constructor(el: ElementRef, domHandler: DomHandler);
    drop(event: any): void;
    dragEnter(event: any): void;
    dragLeave(event: any): void;
    dragOver(event: any): void;
    allowDrop(event: any): boolean;
}
export declare class DragDropModule {
}
