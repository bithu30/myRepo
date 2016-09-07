import { ElementRef, OnDestroy, AfterViewChecked, TemplateRef } from '@angular/core';
import { DomHandler } from '../dom/domhandler';
export declare class PickList implements OnDestroy, AfterViewChecked {
    protected el: ElementRef;
    protected domHandler: DomHandler;
    source: any[];
    target: any[];
    sourceHeader: string;
    targetHeader: string;
    responsive: boolean;
    style: any;
    styleClass: string;
    sourceStyle: any;
    targetStyle: any;
    itemTemplate: TemplateRef<any>;
    hoveredItem: any;
    selectedItems: any[];
    reorderedListElement: any;
    movedUp: boolean;
    movedDown: boolean;
    constructor(el: ElementRef, domHandler: DomHandler);
    ngAfterViewChecked(): void;
    selectItem(event: any, item: any): void;
    moveUp(listElement: any, list: any): void;
    moveTop(listElement: any, list: any): void;
    moveDown(listElement: any, list: any): void;
    moveBottom(listElement: any, list: any): void;
    moveRight(targetListElement: any): void;
    moveAllRight(): void;
    moveLeft(sourceListElement: any): void;
    moveAllLeft(): void;
    isSelected(item: any): boolean;
    findIndexInSelection(item: any): number;
    findIndexInList(item: any, list: any): number;
    ngOnDestroy(): void;
}
export declare class PickListModule {
}
