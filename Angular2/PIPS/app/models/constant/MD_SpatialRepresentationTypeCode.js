"use strict";
var MD_SpatialRepresentationTypeCode = (function () {
    function MD_SpatialRepresentationTypeCode() {
        this.objects = [];
        this.objects.push({ label: 'select a value', value: '' });
        this.objects.push({ label: 'Vector', value: 'vector' });
        this.objects.push({ label: 'Grid', value: 'grid' });
        this.objects.push({ label: 'Texttable', value: 'texttable' });
        this.objects.push({ label: 'Tin', value: 'tin' });
        this.objects.push({ label: 'Stereomodel', value: 'stereomodel' });
        this.objects.push({ label: 'Video', value: 'video' });
    }
    ;
    return MD_SpatialRepresentationTypeCode;
}());
exports.MD_SpatialRepresentationTypeCode = MD_SpatialRepresentationTypeCode;
//# sourceMappingURL=MD_SpatialRepresentationTypeCode.js.map