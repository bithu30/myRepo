import { bootstrap }    from '@angular/platform-browser-dynamic';
import { AppComponent } from './app.component';
import {disableDeprecatedForms, provideForms} from '@angular/forms';
import {PipsDataService} from './pips-data-service';

bootstrap(AppComponent,[
   disableDeprecatedForms(), 
   provideForms(),
   PipsDataService
]);