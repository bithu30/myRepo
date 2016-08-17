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
var core_2 = require('@angular/core');
var Header = (function () {
    function Header() {
    }
    Header = __decorate([
        core_2.Component({
            selector: 'header',
            template: '<ng-content></ng-content>'
        }), 
        __metadata('design:paramtypes', [])
    ], Header);
    return Header;
}());
exports.Header = Header;
var Footer = (function () {
    function Footer() {
    }
    Footer = __decorate([
        core_2.Component({
            selector: 'footer',
            template: '<ng-content></ng-content>'
        }), 
        __metadata('design:paramtypes', [])
    ], Footer);
    return Footer;
}());
exports.Footer = Footer;
var TemplateWrapper = (function () {
    function TemplateWrapper(viewContainer) {
        this.viewContainer = viewContainer;
    }
    TemplateWrapper.prototype.ngOnInit = function () {
        var view = this.viewContainer.createEmbeddedView(this.templateRef, {
            '\$implicit': this.item
        });
    };
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Object)
    ], TemplateWrapper.prototype, "item", void 0);
    __decorate([
        core_1.Input('pTemplateWrapper'), 
        __metadata('design:type', core_1.TemplateRef)
    ], TemplateWrapper.prototype, "templateRef", void 0);
    TemplateWrapper = __decorate([
        core_1.Directive({
            selector: '[pTemplateWrapper]'
        }), 
        __metadata('design:paramtypes', [core_1.ViewContainerRef])
    ], TemplateWrapper);
    return TemplateWrapper;
}());
exports.TemplateWrapper = TemplateWrapper;
//# sourceMappingURL=common.js.map