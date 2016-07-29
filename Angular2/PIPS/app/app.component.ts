import {Component} from '@angular/core'

import {Tabs} from './tabs';
import {Tab} from './tab';

@Component({
  selector: 'pips',
  styles: [`
    .pane{
      padding: 1em;
    }
  `],
  template: `
    <tabs>
      <tab [tabTitle]="'Tab 1'">Tab 1 Content</tab>
      <tab tabTitle="Tab 2">Tab 2 Content</tab>
      <tab tabTitle="Tab 3">Tab 3 Content</tab>
      <tab tabTitle="Tab 4">Tab 4 Content</tab>
    </tabs>
  `,
  directives: [Tabs, Tab]
})
export class AppComponent {
  
}