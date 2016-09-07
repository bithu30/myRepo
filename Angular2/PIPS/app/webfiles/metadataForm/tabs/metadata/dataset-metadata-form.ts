import {Component} from '@angular/core';
import { Singleton } from '../../../../singleton/Singleton'; 
import {SelectItem} from 'primeng/primeng'


@Component({
  selector: 'dataset-metadata-form',
  templateUrl: 'app/webfiles/metadataForm/tabs/metadata/dataset-metadata-form.html',

})

export class DatasetMetadataForm {
  constructor() {
        this.languages = [];
        // this.languages.push({label:'Select City', value:null});
        // this.cities.push({label:'New York', value:{id:1, name: 'New York', code: 'NY'}});
        // this.cities.push({label:'Rome', value:{id:2, name: 'Rome', code: 'RM'}});
        // this.cities.push({label:'London', value:{id:3, name: 'London', code: 'LDN'}});
        // this.cities.push({label:'Istanbul', value:{id:4, name: 'Istanbul', code: 'IST'}});
        // this.cities.push({label:'Paris', value:{id:5, name: 'Paris', code: 'PRS'}});
        this.languages.push({label:'select a value<', value:''});
        this.languages.push({label:'bulgarian', value:'bul'});
        this.languages.push({label:'czech', value:'cze'});
        this.languages.push({label:'danish', value:'dan'});
        this.languages.push({label:'dutch', value:'dut'});
        this.languages.push({label:'english', value:'eng'});
        this.languages.push({label:'estonian', value:'est'});
        this.languages.push({label:'finnish', value:'fin'});
        this.languages.push({label:'french', value:'fre'});
        this.languages.push({label:'german', value:'ger'});
        this.languages.push({label:'greek', value:'gre'});
        this.languages.push({label:'hungarian', value:'hun'});
        this.languages.push({label:'irish', value:'gle'});
        this.languages.push({label:'italian', value:'ita'});
        this.languages.push({label:'latvian', value:'lav'});
        this.languages.push({label:'lithuanian', value:'lit'});
        this.languages.push({label:'maltese', value:'mlt'});
        this.languages.push({label:'polish', value:'pol'});
        this.languages.push({label:'portuguese', value:'por'});
        this.languages.push({label:'romanian', value:'rum'});
        this.languages.push({label:'slovak', value:'slo'});
        this.languages.push({label:'slovenian', value:'slv'});
        this.languages.push({label:'spanish', value:'spa'});
        this.languages.push({label:'swedish', value:'swe'});
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
  languages: SelectItem[];
  cities: SelectItem[];
  
}