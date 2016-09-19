import {Component} from '@angular/core';
import { Singleton } from '../../../../singleton/Singleton'; 




@Component({
  selector: 'spatial-reprsentation-form',
  templateUrl: 'app/webfiles/metadataForm/tabs/spatialRepresentation/spatial-representation-form.html',
})

export class SpatialRepresentationForm {
    json = 'Not Ready';  
    submitted = false;  
    myMetadata = new Singleton().myMetadata;
    MD_SpatialRepresentationTypeCode = new Singleton().MD_SpatialRepresentationTypeCode;
   
    onSubmit() {

        this.submitted = true; 
        console.log('submitted');
        console.log(JSON.stringify(this.myMetadata));
        this.json = JSON.stringify(this.myMetadata);
   }

  
}