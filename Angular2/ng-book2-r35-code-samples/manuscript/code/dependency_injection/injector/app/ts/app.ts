/*
 * Angular
 */
import {
  Component,
  ReflectiveInjector,
} from '@angular/core';
import {bootstrap} from '@angular/platform-browser-dynamic';

/*
 * Webpack
 */
require('css/styles.scss');

/*
 * The injectable service
 */
class MyService {
  getValue(): string {
    return 'a value';
  }
}

@Component({
  selector: 'di-sample-app',
  template: `
  <button (click)="invokeService()">Get Value</button>
  `
})
class DiSampleApp {
  myService: MyService;

  constructor() {
    let injector: any = ReflectiveInjector.resolveAndCreate([MyService]);
    this.myService = injector.get(MyService);
    console.log('Same instance?', this.myService === injector.get(MyService));
  }

  invokeService(): void {
    console.log('MyService returned', this.myService.getValue());
  }
}

// no need to add injectables here
bootstrap(DiSampleApp).catch((err: any) => console.error(err));
