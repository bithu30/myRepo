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
var dataset_basic_form_1 = require('../../webfiles/metadataForm/tabs/basic/dataset-basic-form');
var dataset_desc_form_1 = require('../../webfiles/metadataForm/tabs/description/dataset-desc-form');
var dataset_contact_form_1 = require('../../webfiles/metadataForm/tabs/contact/dataset-contact-form');
var dataset_metadata_form_1 = require('../../webfiles/metadataForm/tabs/metadata/dataset-metadata-form');
var report_form_1 = require('../../webfiles/metadataForm/tabs/report/report-form');
var TemplateForm = (function () {
    function TemplateForm() {
    }
    TemplateForm = __decorate([
        core_1.Component({
            selector: 'templateForm',
            templateUrl: 'app/webfiles/metadataForm/templateForm.html',
            directives: [
                dataset_basic_form_1.DatasetBasicForm,
                dataset_desc_form_1.DatasetDescForm,
                dataset_contact_form_1.DatasetContactForm,
                dataset_metadata_form_1.DatasetMetadataForm,
                report_form_1.ReportForm
            ]
        }), 
        __metadata('design:paramtypes', [])
    ], TemplateForm);
    return TemplateForm;
}());
exports.TemplateForm = TemplateForm;
//# sourceMappingURL=templateForm.js.map