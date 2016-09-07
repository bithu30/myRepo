import {Component} from '@angular/core';
import { Singleton } from '../../../../singleton/Singleton'; 
import {SelectItem} from 'primeng/primeng'


@Component({
  selector: 'dataset-basic-form',
  templateUrl: 'app/webfiles/metadataForm/tabs/basic/dataset-basic-form.html',

})

export class DatasetBasicForm {
  constructor() {
        this.cities = [];
        this.cities.push({label:'Select City', value:null});
        this.cities.push({label:'New York', value:{id:1, name: 'New York', code: 'NY'}});
        this.cities.push({label:'Rome', value:{id:2, name: 'Rome', code: 'RM'}});
        this.cities.push({label:'London', value:{id:3, name: 'London', code: 'LDN'}});
        this.cities.push({label:'Istanbul', value:{id:4, name: 'Istanbul', code: 'IST'}});
        this.cities.push({label:'Paris', value:{id:5, name: 'Paris', code: 'PRS'}});
    };

  myMetadata = new Singleton().myMetadata;
  json = 'Not Ready';
  submitted = false;
  active = true;
  onSubmit() { 
    this.submitted = true; 
    console.log('submitted');
    console.log(JSON.stringify(this.myMetadata));
    this.json = JSON.stringify(this.myMetadata);
  }
  // TODO: Remove this when we're done
  get diagnostic() { return JSON.stringify(this.myMetadata); }

  dateValue:string;
  selectedCity: string;
  selectedValues: string[] = ['val1','val2'];
  cars: SelectItem[];
  cities: SelectItem[];
  
}