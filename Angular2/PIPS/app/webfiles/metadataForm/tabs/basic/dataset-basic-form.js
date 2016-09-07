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
var Singleton_1 = require('../../../../singleton/Singleton');
var DatasetBasicForm = (function () {
    function DatasetBasicForm() {
        this.myMetadata = new Singleton_1.Singleton().myMetadata;
        this.json = 'Not Ready';
        this.submitted = false;
        this.active = true;
        this.selectedValues = ['val1', 'val2'];
        this.cities = [];
        this.cities.push({ label: 'Select City', value: null });
        this.cities.push({ label: 'New York', value: { id: 1, name: 'New York', code: 'NY' } });
        this.cities.push({ label: 'Rome', value: { id: 2, name: 'Rome', code: 'RM' } });
        this.cities.push({ label: 'London', value: { id: 3, name: 'London', code: 'LDN' } });
        this.cities.push({ label: 'Istanbul', value: { id: 4, name: 'Istanbul', code: 'IST' } });
        this.cities.push({ label: 'Paris', value: { id: 5, name: 'Paris', code: 'PRS' } });
    }
    ;
    DatasetBasicForm.prototype.onSubmit = function () {
        this.submitted = true;
        console.log('submitted');
        console.log(JSON.stringify(this.myMetadata));
        this.json = JSON.stringify(this.myMetadata);
    };
    Object.defineProperty(DatasetBasicForm.prototype, "diagnostic", {
        // TODO: Remove this when we're done
        get: function () { return JSON.stringify(this.myMetadata); },
        enumerable: true,
        configurable: true
    });
    DatasetBasicForm = __decorate([
        core_1.Component({
            selector: 'dataset-basic-form',
            templateUrl: 'app/webfiles/metadataForm/tabs/basic/dataset-basic-form.html',
        }), 
        __metadata('design:paramtypes', [])
    ], DatasetBasicForm);
    return DatasetBasicForm;
}());
exports.DatasetBasicForm = DatasetBasicForm;
//# sourceMappingURL=dataset-basic-form.js.map