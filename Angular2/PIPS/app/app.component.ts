import {Component} from '@angular/core';
import {Control}   from '@angular/common';

import {TemplateForm} from './webfiles/metadataForm/templateForm';

@Component({
  selector: 'pips',
    template:`
    <templateForm></templateForm>
    `,
  directives: [TemplateForm],
})
export class AppComponent {

}
