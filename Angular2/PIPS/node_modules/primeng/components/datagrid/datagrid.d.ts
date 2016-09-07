import { ElementRef, AfterViewInit, DoCheck, EventEmitter, IterableDiffers, TemplateRef } from '@angular/core';
export declare class DataGrid implements AfterViewInit, DoCheck {
    protected el: ElementRef;
    value: any[];
    paginator: boolean;
    rows: number;
    columns: number;
    totalRecords: number;
    pageLinks: number;
    rowsPerPageOptions: number[];
    lazy: boolean;
    onLazyLoad: EventEmitter<any>;
    style: any;
    styleClass: string;
    paginatorPosition: string;
    header: any;
    footer: any;
    itemTemplate: TemplateRef<any>;
    protected dataToRender: any[];
    protected first: number;
    protected page: number;
    differ: any;
    constructor(el: ElementRef, differs: IterableDiffers);
    ngAfterViewInit(): void;
    ngDoCheck(): void;
    updatePaginator(): void;
    paginate(event: any): void;
    updateDataToRender(datasource: any): void;
    isEmpty(): boolean;
    createLazyLoadMetadata(): any;
}
export declare class DataGridModule {
}
