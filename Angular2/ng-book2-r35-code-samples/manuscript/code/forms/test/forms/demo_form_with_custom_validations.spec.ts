import {
  it,
  describe,
  inject,
  async,
  addProviders,
} from '@angular/core/testing';
import {
  disableDeprecatedForms,
  provideForms,
  FormBuilder
} from '@angular/forms';
import {
  TestComponentBuilder,
  ComponentFixture
} from '@angular/core/testing';
import { dispatchEvent } from '../util';
import { By } from '@angular/platform-browser/src/dom/debug/by';
import {
  DemoFormWithCustomValidations
} from '../../app/ts/forms/demo_form_with_custom_validations';

describe('DemoFormWithCustomValidations', () => {
  var el, input, form;
  let providerArr: any[];

  beforeEach(() => {
    addProviders([
      disableDeprecatedForms(),
      provideForms(),
      FormBuilder
    ]);
  });

  function createComponent(tcb: TestComponentBuilder): Promise<ComponentFixture<any>> {
    return tcb.overrideProviders(DemoFormWithCustomValidations, providerArr)
              .createAsync(DemoFormWithCustomValidations)
              .then((fixture) => {
      el = fixture.debugElement.nativeElement;
      input = fixture.debugElement.query(By.css("input")).nativeElement;
      form = fixture.debugElement.query(By.css("form")).nativeElement;
      fixture.detectChanges();

      return fixture;
    });
  }

  it('displays errors with no sku', 
     async(inject([TestComponentBuilder], (tcb) => {
    return createComponent(tcb).then((fixture) => {
      input.value = '';
      dispatchEvent(input, 'input');
      fixture.detectChanges();

      let msgs = el.querySelectorAll('.ui.error.message');
      expect(msgs[0].innerHTML).toContain('SKU is invalid');
      expect(msgs[1].innerHTML).toContain('SKU is required');
      expect(msgs[2].innerHTML).toContain('SKU must begin with <tt>123</tt>');
      expect(msgs[3].innerHTML).toContain('Form is invalid');
    });
  })));

  it('removes the required error when sku has a value', 
     async(inject([TestComponentBuilder], (tcb) => {
    return createComponent(tcb).then((fixture) => {
      input.value = 'ABC';
      dispatchEvent(input, 'input');
      fixture.detectChanges();

      let msgs = el.querySelectorAll('.ui.error.message');
      expect(msgs[0].innerHTML).toContain('SKU is invalid');
      expect(msgs[1].innerHTML).toContain('SKU must begin with <tt>123</tt>');
      expect(msgs[2].innerHTML).toContain('Form is invalid');
    });
  })));

  it('removes all errors when sku starts with 123', 
     async(inject([TestComponentBuilder], (tcb) => {
    return createComponent(tcb).then((fixture) => {
      input.value = '123ABC';
      dispatchEvent(input, 'input');
      fixture.detectChanges();

      let msgs = el.querySelectorAll('.ui.error.message');
      expect(msgs.length).toEqual(0);
    });
  })));
});
