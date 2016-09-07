import {Component} from '@angular/core';
import {PipsDataService} from './pips-data-service';
import {TidyPrintPipe  } from './tidyprint-pipe';

@Component({
  selector: 'dataset-basic-form',
  templateUrl: 'app/dataset-basic-form.html',
  pipes: [ TidyPrintPipe ]
 
})

export class DatasetBasicForm {

    constructor ( private pipsDS : PipsDataService) {}

    putVal(val){
        this.pipsDS.add(val);
        
        //console.log(this.pipsDS.get())
    }
    
    sendVal( ) {
    
        this.pipsDS.submitData();
       
        
    }
  
}