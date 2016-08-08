import {Component} from '@angular/core';
import {Control}   from '@angular/common'; 

import {Tabs} from './tabs';
import {Tab} from './tab';
import {BasicForm} from './basic-form-component';

@Component({
  selector: 'pips',
  styles: [`
    .pane{
      padding: 1em;
    }
  `],
  template: `
    <tabs>
      <tab [tabTitle]="'Tab 1'"><basic-form></basic-form></tab>
      <tab [tabTitle]="'Tab 2'"><basic-form></basic-form></tab>
      <tab [tabTitle]="'Tab 3'"><basic-form></basic-form></tab>
    </tabs>
  `,
  directives: [Tabs, Tab, BasicForm]
})
export class AppComponent {
  
}