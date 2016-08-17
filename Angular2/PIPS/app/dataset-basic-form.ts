import {Component} from '@angular/core';



@Component({
  selector: 'dataset-basic-form',
  templateUrl: 'app/dataset-basic-form.html',
 
})

export class DatasetBasicForm {
    
    storeVal(value : any ) {
    
        console.log(value);
       
        
    }
  
}