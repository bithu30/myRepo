import {
  it,
  describe,
  expect,
  inject,
  async,
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
import { DemoFormWithValidationsShorthand } from '../../app/ts/forms/demo_form_with_validations_shorthand';
import {
  dispatchEvent,
  ConsoleSpy
} from '../util';

describe('DemoFormWithValidationsShorthand', () => {
  let originalConsole, fakeConsole;
  let el, input, form;

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

  // restore real console
  afterAll(() => (<any>window).console = originalConsole);

  function createComponent(tcb: TestComponentBuilder): Promise<ComponentFixture<any>> {
    return tcb.createAsync(DemoFormWithValidationsShorthand)
              .then((fixture) => {
      el = fixture.debugElement.nativeElement;
      input = fixture.debugElement.query(By.css("input")).nativeElement;
      form = fixture.debugElement.query(By.css("form")).nativeElement;
      fixture.detectChanges();

      return fixture;
    });
  }

  it('displays errors with no sku', async(inject([TestComponentBuilder], (tcb) => {
    return createComponent(tcb).then((fixture) => {
      input.value = '';
      dispatchEvent(input, 'input');
      fixture.detectChanges();

      // no value on sku field, all error messages are displayed
      let msgs = el.querySelectorAll('.ui.error.message');
      expect(msgs[0].innerHTML).toContain('SKU is invalid');
      expect(msgs[1].innerHTML).toContain('SKU is required');
    });
  })));

  it('displays no errors when sku has a value', async(inject([TestComponentBuilder], (tcb) => {
    return createComponent(tcb).then((fixture) => {
      input.value = 'XYZ';
      dispatchEvent(input, 'input');
      fixture.detectChanges();

      let msgs = el.querySelectorAll('.ui.error.message');
      expect(msgs.length).toEqual(0);
    });
  })));

  it('logs the correct form value to console', inject([TestComponentBuilder],
    fakeAsync((tcb) => {
      createComponent(tcb).then((fixture) => {
        input.value = 'XYZ';
        dispatchEvent(input, 'input');
        tick();

        fixture.detectChanges();
        dispatchEvent(form, 'submit');
        tick();

        expect(fakeConsole.logs).toContain('you submitted value: XYZ');
      });
    })
  ));

});
