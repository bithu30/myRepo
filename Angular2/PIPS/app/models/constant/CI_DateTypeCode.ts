import {SelectItem} from 'primeng/primeng'

export class CI_DateTypeCode{

    objects: SelectItem[];
    constructor() {
        this.objects = [];
        this.objects.push({label:'select a value', value:''});
        this.objects.push({label:'Creation', value:'creation'});
        this.objects.push({label:'Publication', value:'publication'});
        this.objects.push({label:'Revision', value:'revision'});
    };
}
