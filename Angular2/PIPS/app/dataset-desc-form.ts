import {Component} from '@angular/core';



@Component({
  selector: 'dataset-desc-form',
  templateUrl: 'app/dataset-desc-form.html',
 
})

export class DatasetDescForm {
    
    storeVal(value : any ) {
    
        console.log(value);
        
    }
  
}