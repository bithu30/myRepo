/*
 * Angular
 */
import {
  Component,
} from '@angular/core';
import {bootstrap} from '@angular/platform-browser-dynamic';

/*
 * Services
 */
import {ApiService} from 'services/ApiService';

/*
 * Webpack
 */
require('css/styles.scss');

@Component({
  selector: 'di-sample-app',
  template: `
  <button (click)="invokeApi()">Invoke API</button>
  `
})
class DiSampleApp {
  constructor(private apiService: ApiService) {
  }

  invokeApi(): void {
    this.apiService.get();
  }
}

bootstrap(DiSampleApp, [ApiService])
  .catch((err: any) => console.error(err));
