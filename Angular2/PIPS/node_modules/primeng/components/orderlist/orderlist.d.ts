import { ElementRef, AfterViewChecked, TemplateRef, EventEmitter } from '@angular/core';
import { DomHandler } from '../dom/domhandler';
export declare class OrderList implements AfterViewChecked {
    protected el: ElementRef;
    protected domHandler: DomHandler;
    value: any[];
    header: string;
    style: any;
    styleClass: string;
    listStyle: any;
    responsive: boolean;
    onReorder: EventEmitter<any>;
    itemTemplate: TemplateRef<any>;
    hoveredItem: any;
    selectedItems: any[];
    movedUp: boolean;
    movedDown: boolean;
    listContainer: any;
    constructor(el: ElementRef, domHandler: DomHandler);
    ngAfterViewInit(): void;
    ngAfterViewChecked(): void;
    onItemClick(event: any, item: any): void;
    isSelected(item: any): boolean;
    findIndexInList(item: any, list: any): number;
    moveUp(event: any, listElement: any): void;
    moveTop(event: any, listElement: any): void;
    moveDown(event: any, listElement: any): void;
    moveBottom(event: any, listElement: any): void;
}
export declare class OrderListModule {
}
