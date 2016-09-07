import { ElementRef, OnDestroy, Renderer } from '@angular/core';
import { DomHandler } from '../dom/domhandler';
import { MenuItem } from '../common/api';
import { Router } from '@angular/router';
export declare class MegaMenu implements OnDestroy {
    protected el: ElementRef;
    protected domHandler: DomHandler;
    protected renderer: Renderer;
    protected router: Router;
    model: MenuItem[];
    style: any;
    styleClass: string;
    orientation: string;
    activeItem: any;
    activeLink: any;
    constructor(el: ElementRef, domHandler: DomHandler, renderer: Renderer, router: Router);
    onItemMouseEnter(event: any, item: any): void;
    onItemMouseLeave(event: any, link: any): void;
    itemClick(event: any, item: MenuItem): void;
    unsubscribe(item: any): void;
    ngOnDestroy(): void;
    getColumnClass(menuitem: MenuItem): any;
}
export declare class MegaMenuModule {
}
