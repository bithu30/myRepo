import { EventEmitter, TemplateRef } from '@angular/core';
export declare class Column {
    field: string;
    header: string;
    footer: string;
    sortable: any;
    editable: boolean;
    filter: boolean;
    filterMatchMode: string;
    rowspan: number;
    colspan: number;
    style: any;
    styleClass: string;
    hidden: boolean;
    expander: boolean;
    selectionMode: string;
    sortFunction: EventEmitter<any>;
    template: TemplateRef<any>;
}
