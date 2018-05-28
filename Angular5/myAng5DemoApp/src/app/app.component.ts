import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  //styleUrls: ['./app.component.css']
  styles : [`
    h3 {
      color : green;
    }
  `]
})
export class AppComponent {
  title = 'My Angular5 Demo';
  name = ''
  desc=''
}
