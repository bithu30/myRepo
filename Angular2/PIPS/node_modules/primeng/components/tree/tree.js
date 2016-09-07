"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
var core_1 = require('@angular/core');
var common_1 = require('@angular/common');
var TreeNodeTemplateLoader = (function () {
    function TreeNodeTemplateLoader(viewContainer) {
        this.viewContainer = viewContainer;
    }
    TreeNodeTemplateLoader.prototype.ngOnInit = function () {
        var view = this.viewContainer.createEmbeddedView(this.template, {
            '\$implicit': this.node
        });
    };
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Object)
    ], TreeNodeTemplateLoader.prototype, "node", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', core_1.TemplateRef)
    ], TreeNodeTemplateLoader.prototype, "template", void 0);
    TreeNodeTemplateLoader = __decorate([
        core_1.Component({
            selector: 'p-treeNodeTemplateLoader',
            template: ""
        }), 
        __metadata('design:paramtypes', [core_1.ViewContainerRef])
    ], TreeNodeTemplateLoader);
    return TreeNodeTemplateLoader;
}());
exports.TreeNodeTemplateLoader = TreeNodeTemplateLoader;
var UITreeNode = (function () {
    function UITreeNode(tree) {
        this.tree = tree;
        this.hover = false;
        this.expanded = false;
    }
    UITreeNode.prototype.getIcon = function () {
        var icon;
        if (this.node.icon)
            icon = this.node.icon;
        else
            icon = this.expanded ? this.node.expandedIcon : this.node.collapsedIcon;
        return UITreeNode.ICON_CLASS + ' ' + icon;
    };
    UITreeNode.prototype.isLeaf = function () {
        return this.node.leaf == false ? false : !(this.node.children && this.node.children.length);
    };
    UITreeNode.prototype.toggle = function (event) {
        if (this.expanded)
            this.tree.onNodeCollapse.emit({ originalEvent: event, node: this.node });
        else
            this.tree.onNodeExpand.emit({ originalEvent: event, node: this.node });
        this.expanded = !this.expanded;
    };
    UITreeNode.prototype.onNodeClick = function (event) {
        this.tree.onNodeClick(event, this.node);
    };
    UITreeNode.prototype.onNodeRightClick = function (event) {
        this.tree.onNodeRightClick(event, this.node);
    };
    UITreeNode.prototype.isSelected = function () {
        return this.tree.isSelected(this.node);
    };
    UITreeNode.ICON_CLASS = 'ui-treenode-icon fa fa-fw';
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Object)
    ], UITreeNode.prototype, "node", void 0);
    UITreeNode = __decorate([
        core_1.Component({
            selector: 'p-treeNode',
            template: "\n        <li class=\"ui-treenode\" *ngIf=\"node\">\n            <div class=\"ui-treenode-content\" [ngClass]=\"{'ui-treenode-selectable': tree.selectionMode}\" \n                (mouseenter)=\"hover=true\" (mouseleave)=\"hover=false\" (click)=\"onNodeClick($event)\" (contextmenu)=\"onNodeRightClick($event)\">\n                <span class=\"ui-tree-toggler fa fa-fw\" [ngClass]=\"{'fa-caret-right':!expanded,'fa-caret-down':expanded}\" *ngIf=\"!isLeaf()\"\n                        (click)=\"toggle($event)\"></span\n                ><span class=\"ui-treenode-leaf-icon\" *ngIf=\"isLeaf()\"></span\n                ><span [class]=\"getIcon()\" *ngIf=\"node.icon||node.expandedIcon||node.collapsedIcon\"></span\n                ><span class=\"ui-treenode-label ui-corner-all\" \n                    [ngClass]=\"{'ui-state-hover':hover&&tree.selectionMode,'ui-state-highlight':isSelected()}\">\n                        <span *ngIf=\"!tree.template\">{{node.label}}</span>\n                        <p-treeNodeTemplateLoader [node]=\"node\" [template]=\"tree.template\" *ngIf=\"tree.template\"></p-treeNodeTemplateLoader>\n                    </span>\n            </div>\n            <ul class=\"ui-treenode-children\" style=\"display: none;\" *ngIf=\"node.children\" [style.display]=\"expanded ? 'block' : 'none'\">\n                <p-treeNode *ngFor=\"let childNode of node.children\" [node]=\"childNode\"></p-treeNode>\n            </ul>\n        </li>\n    "
        }),
        __param(0, core_1.Inject(core_1.forwardRef(function () { return Tree; }))), 
        __metadata('design:paramtypes', [Tree])
    ], UITreeNode);
    return UITreeNode;
}());
exports.UITreeNode = UITreeNode;
var Tree = (function () {
    function Tree() {
        this.selectionChange = new core_1.EventEmitter();
        this.onNodeSelect = new core_1.EventEmitter();
        this.onNodeUnselect = new core_1.EventEmitter();
        this.onNodeExpand = new core_1.EventEmitter();
        this.onNodeCollapse = new core_1.EventEmitter();
        this.onNodeContextMenuSelect = new core_1.EventEmitter();
    }
    Tree.prototype.onNodeClick = function (event, node) {
        if (event.target.className && event.target.className.indexOf('ui-tree-toggler') === 0) {
            return;
        }
        else {
            var metaKey = (event.metaKey || event.ctrlKey);
            var index = this.findIndexInSelection(node);
            var selected = (index >= 0);
            if (selected && metaKey) {
                if (this.isSingleSelectionMode()) {
                    this.selectionChange.emit(null);
                }
                else {
                    this.selection.splice(index, 1);
                    this.selectionChange.emit(this.selection);
                }
                this.onNodeUnselect.emit({ originalEvent: event, node: node });
            }
            else {
                if (this.isSingleSelectionMode()) {
                    this.selectionChange.emit(node);
                }
                else if (this.isMultipleSelectionMode()) {
                    this.selection = (!event.metaKey) ? [] : this.selection || [];
                    this.selection.push(node);
                    this.selectionChange.emit(this.selection);
                }
                this.onNodeSelect.emit({ originalEvent: event, node: node });
            }
        }
    };
    Tree.prototype.onNodeRightClick = function (event, node) {
        if (this.contextMenu) {
            if (event.target.className && event.target.className.indexOf('ui-tree-toggler') === 0) {
                return;
            }
            else {
                var index = this.findIndexInSelection(node);
                var selected = (index >= 0);
                if (!selected) {
                    if (this.isSingleSelectionMode())
                        this.selectionChange.emit(node);
                    else
                        this.selectionChange.emit([node]);
                }
                this.contextMenu.show(event);
                this.onNodeContextMenuSelect.emit({ originalEvent: event, node: node });
            }
        }
    };
    Tree.prototype.findIndexInSelection = function (node) {
        var index = -1;
        if (this.selectionMode && this.selection) {
            if (this.isSingleSelectionMode()) {
                index = (this.selection == node) ? 0 : -1;
            }
            else if (this.isMultipleSelectionMode()) {
                for (var i = 0; i < this.selection.length; i++) {
                    if (this.selection[i] == node) {
                        index = i;
                        break;
                    }
                }
            }
        }
        return index;
    };
    Tree.prototype.isSelected = function (node) {
        return this.findIndexInSelection(node) != -1;
    };
    Tree.prototype.isSingleSelectionMode = function () {
        return this.selectionMode && this.selectionMode == 'single';
    };
    Tree.prototype.isMultipleSelectionMode = function () {
        return this.selectionMode && this.selectionMode == 'multiple';
    };
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Array)
    ], Tree.prototype, "value", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', String)
    ], Tree.prototype, "selectionMode", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Object)
    ], Tree.prototype, "selection", void 0);
    __decorate([
        core_1.Output(), 
        __metadata('design:type', core_1.EventEmitter)
    ], Tree.prototype, "selectionChange", void 0);
    __decorate([
        core_1.Output(), 
        __metadata('design:type', core_1.EventEmitter)
    ], Tree.prototype, "onNodeSelect", void 0);
    __decorate([
        core_1.Output(), 
        __metadata('design:type', core_1.EventEmitter)
    ], Tree.prototype, "onNodeUnselect", void 0);
    __decorate([
        core_1.Output(), 
        __metadata('design:type', core_1.EventEmitter)
    ], Tree.prototype, "onNodeExpand", void 0);
    __decorate([
        core_1.Output(), 
        __metadata('design:type', core_1.EventEmitter)
    ], Tree.prototype, "onNodeCollapse", void 0);
    __decorate([
        core_1.Output(), 
        __metadata('design:type', core_1.EventEmitter)
    ], Tree.prototype, "onNodeContextMenuSelect", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Object)
    ], Tree.prototype, "style", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', String)
    ], Tree.prototype, "styleClass", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Object)
    ], Tree.prototype, "contextMenu", void 0);
    __decorate([
        core_1.ContentChild(core_1.TemplateRef), 
        __metadata('design:type', core_1.TemplateRef)
    ], Tree.prototype, "template", void 0);
    Tree = __decorate([
        core_1.Component({
            selector: 'p-tree',
            template: "\n        <div [ngClass]=\"'ui-tree ui-widget ui-widget-content ui-corner-all'\" [ngStyle]=\"style\" [class]=\"styleClass\">\n            <ul class=\"ui-tree-container\">\n                <p-treeNode *ngFor=\"let node of value\" [node]=\"node\"></p-treeNode>\n            </ul>\n        </div>\n    "
        }), 
        __metadata('design:paramtypes', [])
    ], Tree);
    return Tree;
}());
exports.Tree = Tree;
var TreeModule = (function () {
    function TreeModule() {
    }
    TreeModule = __decorate([
        core_1.NgModule({
            imports: [common_1.CommonModule],
            exports: [Tree],
            declarations: [Tree, UITreeNode, TreeNodeTemplateLoader]
        }), 
        __metadata('design:paramtypes', [])
    ], TreeModule);
    return TreeModule;
}());
exports.TreeModule = TreeModule;
//# sourceMappingURL=tree.js.map