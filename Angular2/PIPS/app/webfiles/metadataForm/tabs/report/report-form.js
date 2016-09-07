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
var ReportForm = (function () {
    function ReportForm() {
        this.json = 'Not Ready';
        this.submitted = false;
        this.myMetadata = new Singleton_1.Singleton().myMetadata;
        this.CI_DateTypeCode = new Singleton_1.Singleton().CI_DateTypeCode;
        this.Bool = new Singleton_1.Singleton().my_Bool;
    }
    ReportForm.prototype.onSubmit = function () {
        this.submitted = true;
        console.log('submitted');
        console.log(JSON.stringify(this.myMetadata));
        this.json = JSON.stringify(this.myMetadata);
    };
    ReportForm = __decorate([
        core_1.Component({
            selector: 'report-form',
            templateUrl: 'app/webfiles/metadataForm/tabs/report/report-form.html',
        }), 
        __metadata('design:paramtypes', [])
    ], ReportForm);
    return ReportForm;
}());
exports.ReportForm = ReportForm;
//# sourceMappingURL=report-form.js.map