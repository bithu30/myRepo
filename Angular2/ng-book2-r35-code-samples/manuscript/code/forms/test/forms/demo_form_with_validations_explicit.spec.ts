import {
  it,
  describe,
  expect,
  inject,
  async,
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
import { DemoFormWithValidationsExplicit } from '../../app/ts/forms/demo_form_with_validations_explicit';
import {
  dispatchEvent,
  ConsoleSpy
} from '../util';

describe('DemoFormWithValidationsExplicit', () => {
  let el, input, form;

  beforeEach(() => {
    addProviders([
      disableDeprecatedForms(),
      provideForms(),
      FormBuilder
    ]);
  });

  function createComponent(tcb: TestComponentBuilder): Promise<ComponentFixture<any>> {
    return tcb.createAsync(DemoFormWithValidationsExplicit)
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

      let msgs = el.querySelectorAll('.ui.error.message');
      expect(msgs[0].innerHTML).toContain('SKU is invalid');
      expect(msgs[1].innerHTML).toContain('SKU is required');
    });
  })));

  it('displays no errors when sku has a value', async(inject([TestComponentBuilder], (tcb) => {
    return createComponent(tcb).then((fixture) => {
      input.value = 'ABC';
      dispatchEvent(input, 'input');
      fixture.detectChanges();

      let msgs = el.querySelectorAll('.ui.error.message');
      expect(msgs.length).toEqual(0);
    });
  })));
});
