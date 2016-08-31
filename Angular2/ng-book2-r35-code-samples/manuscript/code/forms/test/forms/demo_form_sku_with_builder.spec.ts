import {
  it,
  describe,
  expect,
  inject,
  async
} from '@angular/core/testing';
import { TestComponentBuilder } from '@angular/core/testing';
import {
  disableDeprecatedForms,
  provideForms,
  FormBuilder
} from '@angular/forms';
import { DemoFormSkuBuilder } from '../../app/ts/forms/demo_form_sku_with_builder';

describe('DemoFormSkuBuilder', () => {
  let providerArr: any[];
  beforeEach(() => {
    providerArr = [
      disableDeprecatedForms(),
      provideForms(),
      FormBuilder
    ];
  });

  it('initializes sku', async(inject([TestComponentBuilder], (tcb) => {
    let fb = new FormBuilder();
    return tcb.overrideProviders(DemoFormSkuBuilder, providerArr)
              .createAsync(DemoFormSkuBuilder)
              .then((fixture) => {
      let comp = fixture.debugElement.componentInstance;
      let el = fixture.debugElement.nativeElement;

      fixture.detectChanges();

      // checks SKU on myForm
      expect(comp.myForm.controls.sku.value).toEqual('ABC123');

      // checks SKU on the input element
      expect(el.querySelector('form input').value).toEqual('ABC123');
    });
  })));

});
