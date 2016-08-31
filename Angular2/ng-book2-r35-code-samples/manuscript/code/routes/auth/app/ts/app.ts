/*
 * Angular
 */
import {provide, Component} from '@angular/core';
import {bootstrap} from '@angular/platform-browser-dynamic';
import {
  provideRouter,
  ROUTER_DIRECTIVES,
  Router,
  RouterConfig,
} from '@angular/router';
import {provideForms} from '@angular/forms';
import {LocationStrategy, HashLocationStrategy} from '@angular/common';

/*
 * Components
 */
import {LoginComponent} from 'components/LoginComponent';
import {HomeComponent} from 'components/HomeComponent';
import {AboutComponent} from 'components/AboutComponent';
import {ContactComponent} from 'components/ContactComponent';
import {ProtectedComponent} from 'components/ProtectedComponent';

/*
 * Services
 */
import {AUTH_PROVIDERS} from 'services/AuthService';
import {LoggedInGuard} from 'guards/loggedIn.guard';

/*
 * Webpack
 */
require('css/styles.scss');

@Component({
  selector: 'router-app',
  directives: [ROUTER_DIRECTIVES, LoginComponent],
  template: `
  <div class="page-header">
    <div class="container">
      <h1>Router Sample</h1>
      <div class="navLinks">
        <a [routerLink]="['/home']">Home</a>
        <a [routerLink]="['/about']">About</a>
        <a [routerLink]="['/contact']">Contact us</a>
        <a [routerLink]="['/protected']">Protected</a>
      </div>
    </div>
  </div>

  <div id="content">
    <div class="container">

      <login></login>

      <hr>

      <router-outlet></router-outlet>
    </div>
  </div>
  `
})
class RoutesDemoApp {
  constructor(public router: Router) {
  }
}

const routes: RouterConfig = [
  { path: '',          redirectTo: 'home', terminal: true },
  { path: 'home',      component: HomeComponent },
  { path: 'about',     component: AboutComponent },
  { path: 'contact',   component: ContactComponent },
  { path: 'protected', component: ProtectedComponent,
    canActivate: [LoggedInGuard]}
];

bootstrap(RoutesDemoApp, [
  provideRouter(routes),
  AUTH_PROVIDERS,
  LoggedInGuard,
  provide(LocationStrategy, {useClass: HashLocationStrategy}),
  provideForms()
]);
