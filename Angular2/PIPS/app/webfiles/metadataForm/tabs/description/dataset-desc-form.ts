import {Component} from '@angular/core';
import { Singleton } from '../../../../singleton/Singleton'; 



@Component({
  selector: 'dataset-desc-form',
  templateUrl: 'app/webfiles/metadataForm/tabs/description/dataset-desc-form.html',
})

export class DatasetDescForm {
myMetadata = new Singleton().myMetadata;


  
}