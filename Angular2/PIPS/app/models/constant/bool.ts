import {SelectItem} from 'primeng/primeng'

export class Bool{

    objects: SelectItem[];
    constructor() {
        this.objects = [];
        this.objects.push({label:'select a value', value:''});
        this.objects.push({label:'True', value:'True'});
        this.objects.push({label:'False', value:'False'});
    };
}
