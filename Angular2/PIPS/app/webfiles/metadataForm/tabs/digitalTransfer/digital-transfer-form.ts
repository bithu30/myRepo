import {Component} from '@angular/core';
import { Singleton } from '../../../../singleton/Singleton'; 




@Component({
  selector: 'digital-transfer-form',
  templateUrl: 'app/webfiles/metadataForm/tabs/digitalTransfer/digital-transfer-form.html',
})

export class DigitalTransferForm {
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