import { ElementRef, AfterViewInit, OnDestroy, Renderer } from '@angular/core';
import { DomHandler } from '../dom/domhandler';
import { MenuItem } from '../common/api';
import { Router } from '@angular/router';
export declare class SlideMenuSub implements OnDestroy {
    protected slideMenu: SlideMenu;
    protected router: Router;
    item: MenuItem;
    root: boolean;
    backLabel: string;
    menuWidth: string;
    effectDuration: any;
    easing: string;
    constructor(slideMenu: SlideMenu, router: Router);
    activeItem: any;
    hoveredLink: any;
    itemClick(event: any, item: MenuItem, listitem: any): void;
    ngOnDestroy(): void;
}
export declare class SlideMenu implements AfterViewInit, OnDestroy {
    protected el: ElementRef;
    protected domHandler: DomHandler;
    protected renderer: Renderer;
    model: MenuItem[];
    popup: boolean;
    style: any;
    styleClass: string;
    menuWidth: number;
    viewportHeight: number;
    effectDuration: any;
    easing: string;
    backLabel: string;
    protected container: any;
    protected documentClickListener: any;
    protected preventDocumentDefault: any;
    left: number;
    constructor(el: ElementRef, domHandler: DomHandler, renderer: Renderer);
    ngAfterViewInit(): void;
    toggle(event: any): void;
    show(event: any): void;
    hide(): void;
    unsubscribe(item: any): void;
    onClick(event: any): void;
    goBack(): void;
    ngOnDestroy(): void;
}
export declare class SlideMenuModule {
}
