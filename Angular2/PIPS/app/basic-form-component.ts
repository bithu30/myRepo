import {Component} from '@angular/core';

@Component({
  selector: 'basic-form',
  templateUrl: 'app/basic-form-componenet.html',
 
})

export class BasicForm {
    storeVal(value : any ) {
        console.log(value);
        
    }
  
}