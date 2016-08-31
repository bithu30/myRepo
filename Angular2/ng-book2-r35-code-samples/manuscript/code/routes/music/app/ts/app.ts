/*
 * Angular Imports
 */
import {
  Component,
  provide
} from '@angular/core';
import {bootstrap} from '@angular/platform-browser-dynamic';
import {HTTP_PROVIDERS} from '@angular/http';
import {
  ROUTER_DIRECTIVES,
  provideRouter,
  RouterConfig
} from '@angular/router';
import {
  LocationStrategy,
  HashLocationStrategy,
  APP_BASE_HREF
} from '@angular/common';

/*
 * Components
 */
import {SearchComponent} from 'components/SearchComponent';
import {ArtistComponent} from 'components/ArtistComponent';
import {TrackComponent} from 'components/TrackComponent';
import {AlbumComponent} from 'components/AlbumComponent';

/*
 * Services
 */
import {SPOTIFY_PROVIDERS} from 'services/SpotifyService';
import {provideForms} from '@angular/forms';

/*
 * Webpack
 */
require('css/styles.scss');

@Component({
  selector: 'router-app',
  directives: [ROUTER_DIRECTIVES],
  template: `
  <router-outlet></router-outlet>
  `
})
class RoutesDemoApp {
  query: string;
}

const routes: RouterConfig = [
  { path: '', redirectTo: 'search', terminal: true },
  { path: 'search', component: SearchComponent },
  { path: 'artists/:id', component: ArtistComponent },
  { path: 'tracks/:id', component: TrackComponent },
  { path: 'albums/:id', component: AlbumComponent },
];

const ROUTER_PROVIDER = provideRouter(routes);

bootstrap(RoutesDemoApp, [
  ROUTER_PROVIDER,
  HTTP_PROVIDERS,
  SPOTIFY_PROVIDERS,
  provide(APP_BASE_HREF,            {useValue: '/'}),
  provide(LocationStrategy,         {useClass: HashLocationStrategy}),
  provideForms()
]).catch((err: any) => console.error(err));
