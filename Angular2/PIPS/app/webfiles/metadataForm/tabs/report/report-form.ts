import {Component} from '@angular/core';
import { Singleton } from '../../../../singleton/Singleton'; 




@Component({
  selector: 'report-form',
  templateUrl: 'app/webfiles/metadataForm/tabs/report/report-form.html',
})

export class ReportForm {
    json = 'Not Ready';  
    submitted = false;  
    myMetadata = new Singleton().myMetadata;
    CI_DateTypeCode = new Singleton().CI_DateTypeCode;
    Bool = new Singleton().my_Bool;
    onSubmit() {

        this.submitted = true; 
        console.log('submitted');
        console.log(JSON.stringify(this.myMetadata));
        this.json = JSON.stringify(this.myMetadata);
   }

  
}