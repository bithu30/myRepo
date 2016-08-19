import {Component} from '@angular/core';
import {Control}   from '@angular/common'; 

import {Tabs} from './tabs';
import {Tab} from './tab';
import {BasicForm} from './basic-form-component';
import {DatasetBasicForm} from './dataset-basic-form';
import {DatasetDescForm} from './dataset-desc-form';

@Component({
  selector: 'pips',
  styles: [`
    .pane{
      padding: 1em;
    }
  `],
  template: `
    <tabs>
      <tab [tabTitle]="'DataSet'"><dataset-basic-form></dataset-basic-form></tab>
      <tab [tabTitle]="'Description'"><dataset-desc-form></dataset-desc-form></tab>
    </tabs>
  `,
  directives: [Tabs, Tab, BasicForm, DatasetBasicForm,DatasetDescForm]
})
export class AppComponent {

   
  
}