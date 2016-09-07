"use strict";
var platform_browser_dynamic_1 = require('@angular/platform-browser-dynamic');
var app_component_1 = require('./app.component');
var forms_1 = require('@angular/forms');
var pips_data_service_1 = require('./pips-data-service');
var http_1 = require('@angular/http');
platform_browser_dynamic_1.bootstrap(app_component_1.AppComponent, [
    forms_1.disableDeprecatedForms(),
    forms_1.provideForms(),
    pips_data_service_1.PipsDataService,
    http_1.HTTP_PROVIDERS
]);
//# sourceMappingURL=main.js.map