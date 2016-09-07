import { ElementRef, OnDestroy, Renderer } from '@angular/core';
import { DomHandler } from '../dom/domhandler';
import { MenuItem } from '../common/api';
import { Router } from '@angular/router';
export declare class MenubarSub {
    protected domHandler: DomHandler;
    protected router: Router;
    item: MenuItem;
    root: boolean;
    constructor(domHandler: DomHandler, router: Router);
    activeItem: any;
    activeLink: any;
    onItemMouseEnter(event: any, item: any): void;
    onItemMouseLeave(event: any, link: any): void;
    itemClick(event: any, item: MenuItem): void;
    listClick(event: any): void;
}
export declare class Menubar implements OnDestroy {
    protected el: ElementRef;
    protected domHandler: DomHandler;
    protected renderer: Renderer;
    model: MenuItem[];
    style: any;
    styleClass: string;
    constructor(el: ElementRef, domHandler: DomHandler, renderer: Renderer);
    unsubscribe(item: any): void;
    ngOnDestroy(): void;
}
export declare class MenubarModule {
}
