import {SelectItem} from 'primeng/primeng'

export class MD_SpatialRepresentationTypeCode{

    objects: SelectItem[];
    constructor() {
        this.objects = [];
        this.objects.push({label:'select a value', value:''});
        this.objects.push({label:'Vector', value:'vector'});
        this.objects.push({label:'Grid', value:'grid'});
        this.objects.push({label:'Texttable', value:'texttable'});
        this.objects.push({label:'Tin', value:'tin'});
        this.objects.push({label:'Stereomodel', value:'stereomodel'});
        this.objects.push({label:'Video', value:'video'});
    };
}