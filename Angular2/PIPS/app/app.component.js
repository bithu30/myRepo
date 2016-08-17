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
var tabs_1 = require('./tabs');
var tab_1 = require('./tab');
var basic_form_component_1 = require('./basic-form-component');
var dataset_basic_form_1 = require('./dataset-basic-form');
var dataset_desc_form_1 = require('./dataset-desc-form');
var AppComponent = (function () {
    function AppComponent() {
        this.dataStore = {};
    }
    AppComponent = __decorate([
        core_1.Component({
            selector: 'pips',
            styles: ["\n    .pane{\n      padding: 1em;\n    }\n  "],
            template: "\n    <tabs>\n      <tab [tabTitle]=\"'DataSet'\"><dataset-basic-form></dataset-basic-form></tab>\n      <tab [tabTitle]=\"'Description'\"><dataset-desc-form></dataset-desc-form></tab>\n    </tabs>\n  ",
            directives: [tabs_1.Tabs, tab_1.Tab, basic_form_component_1.BasicForm, dataset_basic_form_1.DatasetBasicForm, dataset_desc_form_1.DatasetDescForm]
        }), 
        __metadata('design:paramtypes', [])
    ], AppComponent);
    return AppComponent;
}());
exports.AppComponent = AppComponent;
//# sourceMappingURL=app.component.js.map