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
var http_1 = require('@angular/http');
require('rxjs/Rx');
var PipsDataService = (function () {
    function PipsDataService(http) {
        this.http = http;
        this.pipsData = [];
    }
    PipsDataService.prototype.add = function (val) {
        return this.pipsData.push(val);
    };
    PipsDataService.prototype.get = function () {
        return this.pipsData;
    };
    PipsDataService.prototype.show = function () {
        console.log(this.pipsData);
    };
    PipsDataService.prototype.extractData = function (res) {
        console.log(res);
        return res;
    };
    PipsDataService.prototype.takeOutData = function (data) {
        console.log("From Subscribe:" + data._body);
        this.out = data._body;
        console.log(this.out);
    };
    PipsDataService.prototype.submitData = function () {
        var _this = this;
        console.log(JSON.stringify(this.pipsData));
        console.log("Going to send formdata for processing");
        var out = [];
        var headers = new http_1.Headers({ 'Content-Type': 'application/json' });
        var options = new http_1.RequestOptions({ headers: headers });
        var url = 'http://pips.ucc.ie/test/test.php';
        this.http.post(url, JSON.stringify(this.pipsData), headers).map(this.extractData)
            .subscribe(function (data) { return _this.takeOutData(data); }, function (err) { return console.error(err); }, function () { return console.log('done'); });
        //window.setInterval(10000000);
    };
    PipsDataService = __decorate([
        core_1.Injectable(), 
        __metadata('design:paramtypes', [http_1.Http])
    ], PipsDataService);
    return PipsDataService;
}());
exports.PipsDataService = PipsDataService;
//# sourceMappingURL=pips-data-service.js.map