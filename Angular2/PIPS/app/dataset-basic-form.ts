import {Component} from '@angular/core';
import {PipsDataService} from './pips-data-service';


@Component({
  selector: 'dataset-basic-form',
  templateUrl: 'app/dataset-basic-form.html',
 
})

export class DatasetBasicForm {

    constructor ( private pipsDS : PipsDataService) {}

    putVal(val){
        this.pipsDS.add(val);
        console.log(this.pipsDS.get())
    }
    
    storeVal(value : any ) {
    
        console.log(value);
       
        
    }
  
}