import { Component } from '@angular/core';
import { bootstrap } from '@angular/platform-browser-dynamic';

@Component({
  selector: 'ng-non-bindable-sample-app',
  template: `
  <div>
    <span class="bordered">{{ content }}</span>
    <span class="pre" ngNonBindable>
      &larr; This is what {{ content }} rendered
    </span>
  </div>
  `
})
class NgNonBindableSampleApp {
  content: string;

  constructor() {
    this.content = 'Some text';
  }
}

bootstrap(NgNonBindableSampleApp);
