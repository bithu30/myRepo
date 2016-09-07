import { ElementRef, AfterViewChecked, AfterViewInit, OnDestroy, IterableDiffers, EventEmitter } from '@angular/core';
import { DomHandler } from '../dom/domhandler';
export declare class Galleria implements AfterViewChecked, AfterViewInit, OnDestroy {
    protected el: ElementRef;
    protected domHandler: DomHandler;
    images: any[];
    style: any;
    styleClass: string;
    panelWidth: number;
    panelHeight: number;
    frameWidth: number;
    frameHeight: number;
    activeIndex: number;
    showFilmstrip: boolean;
    autoPlay: boolean;
    transitionInterval: number;
    showCaption: boolean;
    onImageClicked: EventEmitter<{}>;
    differ: any;
    slideshowActive: boolean;
    protected container: any;
    protected panelWrapper: any;
    protected panels: any;
    protected caption: any;
    protected stripWrapper: any;
    protected strip: any;
    protected frames: any;
    protected interval: any;
    protected stripLeft: number;
    protected imagesChanged: boolean;
    protected initialized: boolean;
    constructor(el: ElementRef, domHandler: DomHandler, differs: IterableDiffers);
    ngAfterViewChecked(): void;
    ngDoCheck(): void;
    ngAfterViewInit(): void;
    render(): void;
    startSlideshow(): void;
    stopSlideshow(): void;
    clickNavRight(): void;
    clickNavLeft(): void;
    frameClick(frame: any): void;
    prev(): void;
    next(): void;
    select(index: any, reposition: any): void;
    clickImage(event: any, image: any, i: any): void;
    ngOnDestroy(): void;
}
export declare class GalleriaModule {
}
