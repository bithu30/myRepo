import { EventEmitter, QueryList } from '@angular/core';
import { TreeNode } from '../common';
import { Column } from '../column/column';
export declare class TreeTable {
    value: TreeNode[];
    selectionMode: string;
    selection: any;
    selectionChange: EventEmitter<any>;
    onNodeSelect: EventEmitter<any>;
    onNodeUnselect: EventEmitter<any>;
    onNodeExpand: EventEmitter<any>;
    onNodeCollapse: EventEmitter<any>;
    style: any;
    styleClass: string;
    header: any;
    footer: any;
    columns: QueryList<Column>;
    onRowClick(event: any, node: any): void;
    findIndexInSelection(node: TreeNode): number;
    isSelected(node: TreeNode): boolean;
    isSingleSelectionMode(): boolean;
    isMultipleSelectionMode(): boolean;
    hasFooter(): boolean;
}
