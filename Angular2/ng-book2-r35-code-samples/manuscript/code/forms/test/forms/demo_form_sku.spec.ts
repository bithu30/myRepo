import {
  it,
  describe,
  expect,
  inject,
  fakeAsync,
  tick,
} from '@angular/core/testing';
import { TestComponentBuilder, ComponentFixture } from '@angular/core/testing';
import { By } from '@angular/platform-browser/src/dom/debug/by';
import { DemoFormSku } from '../../app/ts/forms/demo_form_sku';
import {
  dispatchEvent,
  ConsoleSpy
} from '../util';

describe('DemoFormSku Component', () => {
  let originalConsole, fakeConsole;
  let el, input, form;
  
  beforeEach(() => {
    // replace the real window.console with our spy
    fakeConsole = new ConsoleSpy();
    originalConsole = window.console; 
    (<any>window).console = fakeConsole;
  });

  // restore real console
  afterAll(() => (<any>window).console = originalConsole);

  function createComponent(tcb: TestComponentBuilder): Promise<ComponentFixture<any>> {
    return tcb.createAsync(DemoFormSku)
      .then((fixture) => {
        el = fixture.debugElement.nativeElement;
        input = fixture.debugElement.query(By.css('input')).nativeElement;
        form = fixture.debugElement.query(By.css('form')).nativeElement;
        fixture.detectChanges();

        return fixture;
    });
  }

  it('logs the submitted value', inject([TestComponentBuilder],
    fakeAsync((tcb) => {
      createComponent(tcb).then((fixture) => {
        input.value = 'MY-SKU';
        dispatchEvent(input, 'input');
        fixture.detectChanges();
        tick();

        fixture.detectChanges();
        dispatchEvent(form, 'submit');
        tick();

        expect(fakeConsole.logs).toContain('you submitted value: [object Object]');
      });
    })
  ));
});
