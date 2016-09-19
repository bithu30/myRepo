import {Component} from '@angular/core';
import { Singleton } from '../../../../singleton/Singleton'; 


@Component({
  selector: 'dataset-pointofcontact-form',
  templateUrl: 'app/webfiles/metadataForm/tabs/pointOfContact/dataset-pointofcontact-form.html',

})

export class DatasetPointOfContactForm {
  constructor() {
  };

  myMetadata = new Singleton().myMetadata;
  CI_RoleCode = new Singleton().CI_RoleCode;

  json = 'Not Ready';
  submitted = false;
  active = true;
  onSubmit() { 
    this.submitted = true; 
    console.log('submitted');
    console.log(JSON.stringify(this.myMetadata));
    this.json = JSON.stringify(this.myMetadata);
  }
  
}