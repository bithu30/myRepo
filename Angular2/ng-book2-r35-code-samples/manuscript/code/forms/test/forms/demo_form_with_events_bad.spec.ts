import {
  it,
  describe,
  expect,
  inject,
  fakeAsync,
  tick,
  addProviders
} from '@angular/core/testing';
import {
  TestComponentBuilder,
  ComponentFixture
} from '@angular/core/testing';
import {
  disableDeprecatedForms,
  provideForms,
  FormBuilder
} from '@angular/forms';
import { By } from '@angular/platform-browser/src/dom/debug/by';
import { DemoFormWithEvents } from '../../app/ts/forms/demo_form_with_events';
import {
  dispatchEvent,
  ConsoleSpy
} from '../util';

describe('DemoFormWithEvents (bad)', () => {
  var originalConsole, fakeConsole;
  var el, input, form;

  beforeEach(() => {
    // replace the real window.console with our spy
    fakeConsole = new ConsoleSpy();
    originalConsole = window.console; 
    (<any>window).console = fakeConsole;

    addProviders([
      disableDeprecatedForms(),
      provideForms(),
      FormBuilder
    ]);
  });

  // restores the real console
  afterAll(() => (<any>window).console = originalConsole);

  it('validates and triggers events', inject([TestComponentBuilder],
    fakeAsync((tcb) => {
      tcb.createAsync(DemoFormWithEvents)
          .then((fixture) => {
        let el = fixture.debugElement.nativeElement;
        let input = fixture.debugElement.query(By.css('input')).nativeElement;
        let form = fixture.debugElement.query(By.css('form')).nativeElement;
        fixture.detectChanges();

        input.value = '';
        dispatchEvent(input, 'input');
        fixture.detectChanges();
        tick();

        // no value on sku field, all error messages are displayed
        let msgs = el.querySelectorAll('.ui.error.message');
        expect(msgs[0].innerHTML).toContain('SKU is invalid');
        expect(msgs[1].innerHTML).toContain('SKU is required');

        // displays no errors when sku has a value
        input.value = 'XYZ';
        dispatchEvent(input, 'input');
        fixture.detectChanges();
        tick()

        msgs = el.querySelectorAll('.ui.error.message');
        expect(msgs.length).toEqual(0);

        fixture.detectChanges();
        dispatchEvent(form, 'submit');
        tick();

        // checks for the form submitted message
        expect(fakeConsole.logs).toContain('you submitted value: XYZ');
      });
    })
  ));

});
