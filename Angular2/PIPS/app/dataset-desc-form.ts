import {Component} from '@angular/core';
import {PipsDataService} from './pips-data-service';



@Component({
  selector: 'dataset-desc-form',
  templateUrl: 'app/dataset-desc-form.html',
 
})

export class DatasetDescForm {

    constructor ( private pipsDS : PipsDataService) {}

    putVal(val){
        this.pipsDS.add(val);
        //console.log(this.pipsDS.get())
    }
    
    sendVal() {
    
        this.pipsDS.submitData();
       
        
    }
  
}