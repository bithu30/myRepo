import {
  Component,
  ComponentResolver,
  Injector
} from '@angular/core';
import { tick } from '@angular/core/testing';
import { TestComponentBuilder, ComponentFixture } from '@angular/core/testing';
import { BrowserPlatformLocation } from '@angular/platform-browser';
import {
  ROUTER_DIRECTIVES,
  ActivatedRoute,
  Router,
  RouterConfig,
  RouterOutletMap,
  DefaultUrlSerializer,
  UrlSerializer
} from '@angular/router';
import {
  PlatformLocation,
  Location,
  LocationStrategy,
  HashLocationStrategy
} from '@angular/common';
import { SpyLocation } from '@angular/common/testing';
import { AlbumComponent } from '../app/ts/components/AlbumComponent';
import { ArtistComponent } from '../app/ts/components/ArtistComponent';
import { SearchComponent } from '../app/ts/components/SearchComponent';
import { TrackComponent } from '../app/ts/components/TrackComponent';
import { MockSpotifyService } from './mocks/spotify';

export function advance(fixture: ComponentFixture<any>): void {
  tick();
  fixture.detectChanges();
}

@Component({
  selector: 'blank-cmp',
  template: ``,
  directives: [ROUTER_DIRECTIVES]
})
export class BlankCmp {
}

@Component({
  selector: 'root-cmp',
  template: `<router-outlet></router-outlet>`,
  directives: [ROUTER_DIRECTIVES],
  precompile: [BlankCmp, SearchComponent, ArtistComponent,
               TrackComponent, AlbumComponent]
})
export class RootCmp {
}

export function createRoot(tcb: TestComponentBuilder,
                           router: Router, 
                           type: any): ComponentFixture<any> {
  const f = tcb.createFakeAsync(type);
  advance(f);
  (<any>router).initialNavigation();
  advance(f);
  return f;
}

export const routerConfig: RouterConfig = [
  { path: '', component: BlankCmp },
  { path: 'search', component: SearchComponent },
  { path: 'artists/:id', component: ArtistComponent },
  { path: 'tracks/:id', component: TrackComponent },
  { path: 'albums/:id', component: AlbumComponent }
];

export function musicTestProviders() {
  const mockSpotifyService: MockSpotifyService = new MockSpotifyService();

  return [
    RouterOutletMap,
    {provide: UrlSerializer, useClass: DefaultUrlSerializer},
    {provide: Location, useClass: SpyLocation},
    {provide: LocationStrategy, useClass: HashLocationStrategy},
    {provide: PlatformLocation, useClass: BrowserPlatformLocation},
    {
      provide: Router,
      useFactory: (resolver: ComponentResolver, urlSerializer: UrlSerializer,
                   outletMap: RouterOutletMap, location: Location,
                   injector: Injector) => {
       return new Router(
         RootCmp, resolver, urlSerializer, outletMap,
         location, injector, routerConfig);
      },
      deps: [
        ComponentResolver,
        UrlSerializer,
        RouterOutletMap,
        Location,
        Injector
      ]
    },
    {
      provide: ActivatedRoute,
      useFactory: (r: Router) => r.routerState.root, deps: [Router]
    },
    mockSpotifyService.getProviders(),
  ];
};

