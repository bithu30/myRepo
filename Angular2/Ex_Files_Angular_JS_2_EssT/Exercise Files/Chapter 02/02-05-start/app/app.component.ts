import {Component} from 'angular2/core';
import {MediaItemComponent} from './media-item.component';

@Component({
    selector: 'media-tracker-app',
    templateUrl: 'app/app.component.html',
    directives:[MediaItemComponent],
    styleUrls: ['app/app.component.css']
})
export class AppComponent {}