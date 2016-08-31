/*
 * Angular
 */
import {
  Component,
  provide
} from '@angular/core';
import {bootstrap} from '@angular/platform-browser-dynamic';

/*
 * Services
 */
import {ApiService, API_URL} from 'services/ApiService';

/*
 * Webpack
 */
require('css/styles.scss');

@Component({
  selector: 'di-value-app',
  template: `
  <button (click)="invokeApi()">Invoke API</button>
  `
})
class DiValueApp {
  constructor(private apiService: ApiService) {
  }

  invokeApi(): void {
    this.apiService.get();
  }
}

const isProduction: boolean = false;

bootstrap(DiValueApp, [
  provide(ApiService, { useClass: ApiService }),
  provide(API_URL, {
    useValue: isProduction ?
      'https://production-api.sample.com' :
      'http://dev-api.sample.com'
  })
]).catch((err: any) => console.error(err));
