import {
  it,
  describe,
  async,
  inject,
  addProviders
} from '@angular/core/testing';
import {
  disableDeprecatedForms,
  provideForms,
  FormBuilder
} from '@angular/forms';
import { TestComponentBuilder } from '@angular/core/testing';
import { DemoFormNgModel } from '../../app/ts/forms/demo_form_ng_model';

describe('DemoFormNgModel', () => {
  beforeEach(() => {
    addProviders([
      disableDeprecatedForms(),
      provideForms(),
      FormBuilder
    ]);
  });

  it('requires product name', async(inject([TestComponentBuilder], (tcb) => {
    return tcb.createAsync(DemoFormNgModel)
              .then((fixture) => {
      let comp = fixture.debugElement.componentInstance;
      let el = fixture.debugElement.nativeElement;

      // error message is displayed when product name is empty
      comp.productName = '';
      fixture.detectChanges();
      expect(el.querySelector('.ui.error.message').innerHTML)
                  .toContain('Form is invalid');

      // error message is not present when product name has a value
      comp.productName = 'something';
      fixture.detectChanges();
      expect(el.querySelector('.ui.error.message')).toBeNull();
    });
  })));
});
