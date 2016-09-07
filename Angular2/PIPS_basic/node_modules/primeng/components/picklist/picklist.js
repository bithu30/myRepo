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
var core_1 = require('@angular/core');
var button_1 = require('../button/button');
var domhandler_1 = require('../dom/domhandler');
var common_1 = require('../common');
var PickList = (function () {
    function PickList(el, domHandler) {
        this.el = el;
        this.domHandler = domHandler;
    }
    PickList.prototype.ngAfterViewChecked = function () {
        if (this.movedUp || this.movedDown) {
            var listItems = this.domHandler.find(this.reorderedListElement, 'li.ui-state-highlight');
            var listItem = void 0;
            if (this.movedUp)
                listItem = listItems[0];
            else
                listItem = listItems[listItems.length - 1];
            this.domHandler.scrollInView(this.reorderedListElement, listItem);
            this.movedUp = false;
            this.movedDown = false;
            this.reorderedListElement = null;
        }
    };
    PickList.prototype.selectItem = function (event, item) {
        var metaKey = (event.metaKey || event.ctrlKey);
        var index = this.findIndexInSelection(item);
        var selected = (index != -1);
        if (selected && metaKey) {
            this.selectedItems.splice(index, 1);
        }
        else {
            this.selectedItems = (metaKey) ? this.selectedItems || [] : [];
            this.selectedItems.push(item);
        }
    };
    PickList.prototype.moveUp = function (listElement, list) {
        if (this.selectedItems) {
            for (var i = 0; i < this.selectedItems.length; i++) {
                var selectedItem = this.selectedItems[i];
                var selectedItemIndex = this.findIndexInList(selectedItem, list);
                if (selectedItemIndex != 0) {
                    var movedItem = list[selectedItemIndex];
                    var temp = list[selectedItemIndex - 1];
                    list[selectedItemIndex - 1] = movedItem;
                    list[selectedItemIndex] = temp;
                }
                else {
                    break;
                }
            }
            this.movedUp = true;
            this.reorderedListElement = listElement;
        }
    };
    PickList.prototype.moveTop = function (listElement, list) {
        if (this.selectedItems) {
            for (var i = 0; i < this.selectedItems.length; i++) {
                var selectedItem = this.selectedItems[i];
                var selectedItemIndex = this.findIndexInList(selectedItem, list);
                if (selectedItemIndex != 0) {
                    var movedItem = list.splice(selectedItemIndex, 1)[0];
                    list.unshift(movedItem);
                }
                else {
                    break;
                }
            }
            listElement.scrollTop = 0;
        }
    };
    PickList.prototype.moveDown = function (listElement, list) {
        if (this.selectedItems) {
            for (var i = this.selectedItems.length - 1; i >= 0; i--) {
                var selectedItem = this.selectedItems[i];
                var selectedItemIndex = this.findIndexInList(selectedItem, list);
                if (selectedItemIndex != (list.length - 1)) {
                    var movedItem = list[selectedItemIndex];
                    var temp = list[selectedItemIndex + 1];
                    list[selectedItemIndex + 1] = movedItem;
                    list[selectedItemIndex] = temp;
                }
                else {
                    break;
                }
            }
            this.movedDown = true;
            this.reorderedListElement = listElement;
        }
    };
    PickList.prototype.moveBottom = function (listElement, list) {
        if (this.selectedItems) {
            for (var i = this.selectedItems.length - 1; i >= 0; i--) {
                var selectedItem = this.selectedItems[i];
                var selectedItemIndex = this.findIndexInList(selectedItem, list);
                if (selectedItemIndex != (list.length - 1)) {
                    var movedItem = list.splice(selectedItemIndex, 1)[0];
                    list.push(movedItem);
                }
                else {
                    break;
                }
            }
            listElement.scrollTop = listElement.scrollHeight;
        }
    };
    PickList.prototype.moveRight = function (targetListElement) {
        if (this.selectedItems) {
            for (var i = 0; i < this.selectedItems.length; i++) {
                var selectedItem = this.selectedItems[i];
                if (this.findIndexInList(selectedItem, this.target) == -1) {
                    this.target.push(this.source.splice(this.findIndexInList(selectedItem, this.source), 1)[0]);
                }
            }
            this.selectedItems = [];
        }
    };
    PickList.prototype.moveAllRight = function () {
        if (this.selectedItems) {
            for (var i = 0; i < this.source.length; i++) {
                this.target.push(this.source[i]);
            }
            this.source.splice(0, this.source.length);
            this.selectedItems = [];
        }
    };
    PickList.prototype.moveLeft = function (sourceListElement) {
        if (this.selectedItems) {
            for (var i = 0; i < this.selectedItems.length; i++) {
                var selectedItem = this.selectedItems[i];
                if (this.findIndexInList(selectedItem, this.source) == -1) {
                    this.source.push(this.target.splice(this.findIndexInList(selectedItem, this.target), 1)[0]);
                }
            }
            this.selectedItems = [];
        }
    };
    PickList.prototype.moveAllLeft = function () {
        if (this.selectedItems) {
            for (var i = 0; i < this.target.length; i++) {
                this.source.push(this.target[i]);
            }
            this.target.splice(0, this.target.length);
            this.selectedItems = [];
        }
    };
    PickList.prototype.isSelected = function (item) {
        return this.findIndexInSelection(item) != -1;
    };
    PickList.prototype.findIndexInSelection = function (item) {
        return this.findIndexInList(item, this.selectedItems);
    };
    PickList.prototype.findIndexInList = function (item, list) {
        var index = -1;
        if (list) {
            for (var i = 0; i < list.length; i++) {
                if (list[i] == item) {
                    index = i;
                    break;
                }
            }
        }
        return index;
    };
    PickList.prototype.ngOnDestroy = function () {
    };
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Array)
    ], PickList.prototype, "source", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Array)
    ], PickList.prototype, "target", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', String)
    ], PickList.prototype, "sourceHeader", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', String)
    ], PickList.prototype, "targetHeader", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Boolean)
    ], PickList.prototype, "responsive", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Object)
    ], PickList.prototype, "style", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', String)
    ], PickList.prototype, "styleClass", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Object)
    ], PickList.prototype, "sourceStyle", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Object)
    ], PickList.prototype, "targetStyle", void 0);
    __decorate([
        core_1.ContentChild(core_1.TemplateRef), 
        __metadata('design:type', core_1.TemplateRef)
    ], PickList.prototype, "itemTemplate", void 0);
    PickList = __decorate([
        core_1.Component({
            selector: 'p-pickList',
            template: "\n        <div [class]=\"styleClass\" [ngStyle]=\"style\" [ngClass]=\"{'ui-picklist ui-widget ui-helper-clearfix': true, 'ui-picklist-responsive': responsive}\">\n            <div class=\"ui-picklist-source-controls ui-picklist-buttons\">\n                <div class=\"ui-picklist-buttons-cell\">\n                    <button type=\"button\" pButton icon=\"fa-angle-up\" (click)=\"moveUp(sourcelist,source)\"></button>\n                    <button type=\"button\" pButton icon=\"fa-angle-double-up\" (click)=\"moveTop(sourcelist,source)\"></button>\n                    <button type=\"button\" pButton icon=\"fa-angle-down\" (click)=\"moveDown(sourcelist,source)\"></button>\n                    <button type=\"button\" pButton icon=\"fa-angle-double-down\" (click)=\"moveBottom(sourcelist,source)\"></button>\n                </div>\n            </div>\n            <div class=\"ui-picklist-listwrapper ui-picklist-source-wrapper\">\n                <div class=\"ui-picklist-caption ui-widget-header ui-corner-tl ui-corner-tr\" *ngIf=\"sourceHeader\">{{sourceHeader}}</div>\n                <ul #sourcelist class=\"ui-widget-content ui-picklist-list ui-picklist-source ui-corner-bottom\" [ngStyle]=\"sourceStyle\">\n                    <li *ngFor=\"let item of source\" [ngClass]=\"{'ui-picklist-item':true,'ui-state-hover':(hoveredItem==item),'ui-state-highlight':isSelected(item)}\"\n                        (mouseenter)=\"hoveredItem=item\" (mouseleave)=\"hoveredItem=null\" (click)=\"selectItem($event,item)\">\n                        <template [pTemplateWrapper]=\"itemTemplate\" [item]=\"item\"></template>\n                    </li>\n                </ul>\n            </div>\n            <div class=\"ui-picklist-buttons\">\n                <div class=\"ui-picklist-buttons-cell\">\n                    <button type=\"button\" pButton icon=\"fa-angle-right\" (click)=\"moveRight(targetlist)\"></button>\n                    <button type=\"button\" pButton icon=\"fa-angle-double-right\" (click)=\"moveAllRight()\"></button>\n                    <button type=\"button\" pButton icon=\"fa-angle-left\" (click)=\"moveLeft(sourcelist)\"></button>\n                    <button type=\"button\" pButton icon=\"fa-angle-double-left\" (click)=\"moveAllLeft()\"></button>\n                </div>\n            </div>\n            <div class=\"ui-picklist-listwrapper ui-picklist-target-wrapper\">\n                <div class=\"ui-picklist-caption ui-widget-header ui-corner-tl ui-corner-tr\" *ngIf=\"targetHeader\">{{targetHeader}}</div>\n                <ul #targetlist class=\"ui-widget-content ui-picklist-list ui-picklist-target ui-corner-bottom\" [ngStyle]=\"targetStyle\">\n                    <li *ngFor=\"let item of target\" [ngClass]=\"{'ui-picklist-item':true,'ui-state-hover':(hoveredItem==item),'ui-state-highlight':isSelected(item)}\"\n                        (mouseenter)=\"hoveredItem=item\" (mouseleave)=\"hoveredItem=null\" (click)=\"selectItem($event,item)\">\n                        <template [pTemplateWrapper]=\"itemTemplate\" [item]=\"item\"></template>\n                    </li>\n                </ul>\n            </div>\n            <div class=\"ui-picklist-target-controls ui-picklist-buttons\">\n                <div class=\"ui-picklist-buttons-cell\">\n                    <button type=\"button\" pButton icon=\"fa-angle-up\" (click)=\"moveUp(targetlist,target)\"></button>\n                    <button type=\"button\" pButton icon=\"fa-angle-double-up\" (click)=\"moveTop(targetlist,target)\"></button>\n                    <button type=\"button\" pButton icon=\"fa-angle-down\" (click)=\"moveDown(targetlist,target)\"></button>\n                    <button type=\"button\" pButton icon=\"fa-angle-double-down\" (click)=\"moveBottom(targetlist,target)\"></button>\n                </div>\n            </div>\n        </div>\n    ",
            directives: [button_1.Button, common_1.TemplateWrapper],
            providers: [domhandler_1.DomHandler]
        }), 
        __metadata('design:paramtypes', [core_1.ElementRef, domhandler_1.DomHandler])
    ], PickList);
    return PickList;
}());
exports.PickList = PickList;
//# sourceMappingURL=picklist.js.map