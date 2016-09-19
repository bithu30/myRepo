import {Component} from '@angular/core';
import { Singleton } from '../../../../singleton/Singleton'; 




@Component({
  selector: 'extent-form',
  templateUrl: 'app/webfiles/metadataForm/tabs/Extent/extent-form.html',
})

export class ExtentForm {
    json = 'Not Ready';  
    submitted = false;  
    myMetadata = new Singleton().myMetadata;
   
    onSubmit() {

        this.submitted = true; 
        console.log('submitted');
        console.log(JSON.stringify(this.myMetadata));
        this.json = JSON.stringify(this.myMetadata);
   }

  
}