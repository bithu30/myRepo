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
var common_1 = require('@angular/common');
var shared_1 = require('../common/shared');
var Accordion = (function () {
    function Accordion(el) {
        this.el = el;
        this.onClose = new core_1.EventEmitter();
        this.onOpen = new core_1.EventEmitter();
        this.tabs = [];
    }
    Accordion.prototype.addTab = function (tab) {
        this.tabs.push(tab);
    };
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Boolean)
    ], Accordion.prototype, "multiple", void 0);
    __decorate([
        core_1.Output(), 
        __metadata('design:type', core_1.EventEmitter)
    ], Accordion.prototype, "onClose", void 0);
    __decorate([
        core_1.Output(), 
        __metadata('design:type', core_1.EventEmitter)
    ], Accordion.prototype, "onOpen", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Object)
    ], Accordion.prototype, "style", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', String)
    ], Accordion.prototype, "styleClass", void 0);
    Accordion = __decorate([
        core_1.Component({
            selector: 'p-accordion',
            template: "\n        <div [ngClass]=\"'ui-accordion ui-widget ui-helper-reset'\" [ngStyle]=\"style\" [class]=\"styleClass\">\n            <ng-content></ng-content>\n        </div>\n    ",
        }), 
        __metadata('design:paramtypes', [core_1.ElementRef])
    ], Accordion);
    return Accordion;
}());
exports.Accordion = Accordion;
var AccordionTab = (function () {
    function AccordionTab(accordion) {
        this.accordion = accordion;
        this.accordion.addTab(this);
    }
    AccordionTab.prototype.toggle = function (event) {
        var _this = this;
        if (this.disabled) {
            return;
        }
        this.animating = true;
        var index = this.findTabIndex();
        if (this.selected) {
            this.selected = !this.selected;
            this.accordion.onClose.emit({ originalEvent: event, index: index });
        }
        else {
            if (!this.accordion.multiple) {
                for (var i = 0; i < this.accordion.tabs.length; i++) {
                    this.accordion.tabs[i].selected = false;
                }
            }
            this.selected = true;
            this.accordion.onOpen.emit({ originalEvent: event, index: index });
        }
        //TODO: Use onDone of animate callback instead with RC6
        setTimeout(function () {
            _this.animating = false;
        }, 400);
        event.preventDefault();
    };
    AccordionTab.prototype.findTabIndex = function () {
        var index = -1;
        for (var i = 0; i < this.accordion.tabs.length; i++) {
            if (this.accordion.tabs[i] == this) {
                index = i;
                break;
            }
        }
        return index;
    };
    __decorate([
        core_1.Input(), 
        __metadata('design:type', String)
    ], AccordionTab.prototype, "header", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Boolean)
    ], AccordionTab.prototype, "selected", void 0);
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Boolean)
    ], AccordionTab.prototype, "disabled", void 0);
    __decorate([
        core_1.ContentChild(shared_1.Header), 
        __metadata('design:type', Object)
    ], AccordionTab.prototype, "headerFacet", void 0);
    AccordionTab = __decorate([
        core_1.Component({
            selector: 'p-accordionTab',
            template: "\n        <div class=\"ui-accordion-header ui-state-default ui-corner-all\" [ngClass]=\"{'ui-state-active': selected,'ui-state-hover':hover&&!disabled,'ui-state-disabled':disabled}\"\n            (click)=\"toggle($event)\" (mouseenter)=\"hover = true\" (mouseleave)=\"hover=false\">\n            <span class=\"fa fa-fw\" [ngClass]=\"{'fa-caret-down': selected, 'fa-caret-right': !selected}\"></span>\n            <a href=\"#\" *ngIf=\"!headerFacet\">{{header}}</a>\n            <a href=\"#\" *ngIf=\"headerFacet\">\n                <ng-content select=\"header\"></ng-content>\n            </a>\n        </div>\n        <div class=\"ui-accordion-content-wrapper\" [@tabContent]=\"selected ? 'visible' : 'hidden'\" \n            [ngClass]=\"{'ui-accordion-content-wrapper-overflown': !selected||animating}\">\n            <div class=\"ui-accordion-content ui-widget-content\">\n                <ng-content></ng-content>\n            </div>\n        </div>\n    ",
            animations: [
                core_1.trigger('tabContent', [
                    core_1.state('hidden', core_1.style({
                        height: '0px'
                    })),
                    core_1.state('visible', core_1.style({
                        height: '*'
                    })),
                    core_1.transition('visible => hidden', core_1.animate('400ms cubic-bezier(0.86, 0, 0.07, 1)')),
                    core_1.transition('hidden => visible', core_1.animate('400ms cubic-bezier(0.86, 0, 0.07, 1)'))
                ])
            ]
        }), 
        __metadata('design:paramtypes', [Accordion])
    ], AccordionTab);
    return AccordionTab;
}());
exports.AccordionTab = AccordionTab;
var AccordionModule = (function () {
    function AccordionModule() {
    }
    AccordionModule = __decorate([
        core_1.NgModule({
            imports: [common_1.CommonModule],
            exports: [Accordion, AccordionTab],
            declarations: [Accordion, AccordionTab]
        }), 
        __metadata('design:paramtypes', [])
    ], AccordionModule);
    return AccordionModule;
}());
exports.AccordionModule = AccordionModule;
//# sourceMappingURL=accordion.js.map