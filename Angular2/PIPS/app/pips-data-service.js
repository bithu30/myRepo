"use strict";
var PipsDataService = (function () {
    function PipsDataService() {
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
    return PipsDataService;
}());
exports.PipsDataService = PipsDataService;
//# sourceMappingURL=pips-data-service.js.map