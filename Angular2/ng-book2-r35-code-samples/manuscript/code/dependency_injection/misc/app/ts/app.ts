/*
 * Angular
 */
import {
  Component,
  provide
} from '@angular/core';
import {bootstrap} from '@angular/platform-browser-dynamic';

/*
 * Webpack
 */
require('css/styles.scss');

class SimpleService {
  constructor() {
    console.log('SimpleService is being created');
  }

  getValue(): string {
    return 'a value';
  }
}

class ParamService {
  constructor(private phrase: string) {
    console.log('ParamService is being created with phrase', phrase);
  }

  getValue(): string {
    return this.phrase;
  }
}

@Component({
  selector: 'di-sample-app',
  template: `
  <button (click)="invokeService()">Get Value</button>
  `
})
class DiSampleApp {
  constructor(private simpleService: SimpleService,
              private paramService: ParamService) {}

  invokeService(): void {
    console.log('SimpleService returned', this.simpleService.getValue());
    console.log('ParamService returned', this.paramService.getValue());
  }
}

bootstrap(DiSampleApp, [
  SimpleService,
  provide(ParamService, {
    useFactory: (): ParamService => new ParamService('YOLO')
  })
]).catch((err: any) => console.error(err));
