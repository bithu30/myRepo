import { ElementRef, Renderer, AfterViewInit, OnDestroy } from '@angular/core';
import { DomHandler } from '../dom/domhandler';
export declare class Lightbox implements AfterViewInit, OnDestroy {
    protected el: ElementRef;
    protected domHandler: DomHandler;
    protected renderer: Renderer;
    images: any[];
    type: string;
    style: any;
    styleClass: string;
    easing: 'ease-out';
    effectDuration: any;
    protected visible: boolean;
    protected loading: boolean;
    protected currentImage: any;
    protected captionText: string;
    protected zindex: any;
    protected panel: any;
    protected index: number;
    protected mask: any;
    protected preventDocumentClickListener: boolean;
    protected documentClickListener: any;
    constructor(el: ElementRef, domHandler: DomHandler, renderer: Renderer);
    onImageClick(event: any, image: any, i: any, content: any): void;
    ngAfterViewInit(): void;
    onLinkClick(event: any, content: any): void;
    displayImage(image: any): void;
    show(): void;
    hide(event: any): void;
    center(): void;
    onImageLoad(event: any, content: any): void;
    prev(placeholder: any): void;
    next(placeholder: any): void;
    leftVisible: boolean;
    rightVisible: boolean;
    ngOnDestroy(): void;
}
export declare class LightboxModule {
}
