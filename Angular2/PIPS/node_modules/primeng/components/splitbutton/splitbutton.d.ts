import { ElementRef, OnInit, OnDestroy, EventEmitter, Renderer } from '@angular/core';
import { DomHandler } from '../dom/domhandler';
import { MenuItem } from '../common/api';
import { Router } from '@angular/router';
export declare class SplitButton implements OnInit, OnDestroy {
    protected el: ElementRef;
    protected domHandler: DomHandler;
    protected renderer: Renderer;
    protected router: Router;
    model: MenuItem[];
    icon: string;
    iconPos: string;
    label: string;
    onClick: EventEmitter<any>;
    style: any;
    styleClass: string;
    menuStyle: any;
    menuStyleClass: string;
    protected hoverDefaultBtn: boolean;
    protected focusDefaultBtn: boolean;
    protected activeDefaultBtn: boolean;
    protected hoverDropdown: boolean;
    protected focusDropdown: boolean;
    protected activeDropdown: boolean;
    protected hoveredItem: any;
    protected menuVisible: boolean;
    protected documentClickListener: any;
    constructor(el: ElementRef, domHandler: DomHandler, renderer: Renderer, router: Router);
    ngOnInit(): void;
    onDefaultButtonClick(event: any): void;
    itemClick(event: any, item: MenuItem): void;
    onDropdownClick(event: any, menu: any, container: any): void;
    ngOnDestroy(): void;
}
export declare class SplitButtonModule {
}
