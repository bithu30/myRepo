import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent }  from './app.component';
import {TemplateForm} from './webfiles/metadataForm/templateForm';

import {FormControl, FormGroup} from '@angular/forms';
// import {FormsModule, ReactiveFormsModule} from '@angular/forms';
// import {disableDeprecatedForms, provideForms} from '@angular/forms';
import { FormsModule }   from '@angular/forms';

import {InputTextModule} from 'primeng/primeng';
import {ButtonModule} from 'primeng/primeng';
import {TabViewModule} from 'primeng/primeng';
import {CheckboxModule} from 'primeng/primeng';
import {DropdownModule} from 'primeng/primeng';
import {CalendarModule} from 'primeng/primeng';
import {FieldsetModule} from 'primeng/primeng';

@NgModule({
  imports: [BrowserModule,
    FormsModule,
    // disableDeprecatedForms,
    // provideForms,
    // FormControl,
    // FormGroup,
    // FormsModule,
    // ReactiveFormsModule,


    InputTextModule,
    ButtonModule,
    TabViewModule,
    CheckboxModule,
    DropdownModule,
    CalendarModule,
    FieldsetModule
  ],
  declarations: [AppComponent, TemplateForm],
  bootstrap: [AppComponent]
})
export class AppModule { }
