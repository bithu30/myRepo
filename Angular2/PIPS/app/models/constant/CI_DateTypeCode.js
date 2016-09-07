"use strict";
var CI_DateTypeCode = (function () {
    function CI_DateTypeCode() {
        this.objects = [];
        this.objects.push({ label: 'select a value', value: '' });
        this.objects.push({ label: 'Creation', value: 'creation' });
        this.objects.push({ label: 'Publication', value: 'publication' });
        this.objects.push({ label: 'Revision', value: 'revision' });
    }
    ;
    return CI_DateTypeCode;
}());
exports.CI_DateTypeCode = CI_DateTypeCode;
//# sourceMappingURL=CI_DateTypeCode.js.map