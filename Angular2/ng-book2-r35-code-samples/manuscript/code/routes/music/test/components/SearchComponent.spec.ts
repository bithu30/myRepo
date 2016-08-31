import {
  it,
  describe,
  inject,
  fakeAsync,
  addProviders
} from '@angular/core/testing';
import { Router } from '@angular/router';
import { Location } from '@angular/common';
import { TestComponentBuilder } from '@angular/core/testing';
import { MockSpotifyService } from '../mocks/spotify';
import { SpotifyService } from '../../app/ts/services/SpotifyService';
import {
  musicTestProviders,
  advance,
  createRoot,
  RootCmp
} from '../MusicTestHelpers';

describe('SearchComponent', () => {
  beforeEach(() => {
    addProviders(musicTestProviders());
  });

  describe('initialization', () => {
    it(`doesn't search for a track without a query`, fakeAsync(
      inject([Router, TestComponentBuilder, SpotifyService],
             (router: Router, tcb: TestComponentBuilder,
              mockSpotifyService: MockSpotifyService) => {
                const searchSpy = mockSpotifyService.spy('searchTrack');
                const fixture = createRoot(tcb, router, RootCmp);
                router.navigateByUrl('/search');
                advance(fixture);
                expect(searchSpy).not.toHaveBeenCalled();
              })));

    it(`searches for a track if a query is provided`, fakeAsync(
      inject([Router, TestComponentBuilder, SpotifyService],
             (router: Router, tcb: TestComponentBuilder,
              mockSpotifyService: MockSpotifyService) => {
                const searchSpy = mockSpotifyService.spy('searchTrack');
                const fixture = createRoot(tcb, router, RootCmp);
                router.navigateByUrl('/search?query=cats');
                advance(fixture);
                expect(searchSpy).toHaveBeenCalled();
              })));
  });

  describe('submitting a search', () => {
    it('navigates to the Search route', fakeAsync(
      inject([Router, TestComponentBuilder, Location],
         (router: Router, tcb: TestComponentBuilder, location: Location) => {
           const fixture = createRoot(tcb, router, RootCmp);
           expect(location.path()).toEqual('/');

           router.navigateByUrl('/search');
           advance(fixture);

           const searchComponent = fixture.debugElement.children[1].componentInstance;
           const searchSpy = spyOn(searchComponent, 'search');
           searchComponent.submit('cats');
           advance(fixture);

           expect(location.path()).toEqual('/search?query=cats');
           expect(searchSpy).toHaveBeenCalled();
         })));

    it('can search with a button', fakeAsync(
      inject([Router, TestComponentBuilder, Location],
         (router: Router, tcb: TestComponentBuilder, location: Location) => {
           const fixture = createRoot(tcb, router, RootCmp);
           router.navigateByUrl('/search');
           advance(fixture);
           expect(location.path()).toEqual('/search');

           const compiled = fixture.debugElement.nativeElement;
           const searchComponent = fixture.debugElement.children[1].componentInstance;
           const searchSpy = spyOn(searchComponent, 'search');
           const input = compiled.querySelector('input');
           const button = compiled.querySelector('button');

           input.value = 'cats';
           button.click();
           advance(fixture);

           expect(location.path()).toEqual('/search?query=cats');
           expect(searchSpy).toHaveBeenCalled();
         })));
  });

  describe('renderResults', () => {
    it('displays a message when no results are found', fakeAsync(
      inject([Router, TestComponentBuilder, Location, SpotifyService],
         (router: Router, tcb: TestComponentBuilder, 
          location: Location, mockSpotifyService: MockSpotifyService) => {
           const fixture = createRoot(tcb, router, RootCmp);
           router.navigateByUrl('/search');
           advance(fixture);

           mockSpotifyService.setResponse({tracks: {items: []}});

           const compiled = fixture.debugElement.nativeElement;
           const input = compiled.querySelector('input');
           const button = compiled.querySelector('button');

           input.value = 'cats';
           button.click();
           advance(fixture);

           expect(compiled.innerText)
            .toContain(`No tracks were found with the term 'cats'`);
         })));

    it('displays results', fakeAsync(
      inject([Router, TestComponentBuilder, Location, SpotifyService],
         (router: Router, tcb: TestComponentBuilder, 
          location: Location, mockSpotifyService: MockSpotifyService) => {
           const fixture = createRoot(tcb, router, RootCmp);
           router.navigateByUrl('/search');
           advance(fixture);

          var response = {
            tracks: {
              items: [
                {
                  id: 1,
                  name: 'TRACK',
                  album: { id: 2, name: 'ALBUM', images: [{url: 'IMAGE_1'}] },
                  artists: [ {id: 3, name: 'ARTIST'} ]}]}};

           mockSpotifyService.setResponse(response);

           const compiled = fixture.debugElement.nativeElement;
           const input = compiled.querySelector('input');
           const button = compiled.querySelector('button');

           input.value = 'cats';
           button.click();
           advance(fixture);

           expect(compiled.querySelector('img').src).toContain('IMAGE_1');

           // checks the artist, track and album information
           var links = compiled.querySelectorAll('a');
           expect(links.length).toEqual(3);
           expect(links[0].innerText).toEqual('ARTIST');
           expect(links[1].innerText).toEqual('TRACK');
           expect(links[2].innerText).toEqual('ALBUM');
         })));
  });
});
