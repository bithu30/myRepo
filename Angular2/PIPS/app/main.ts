import { bootstrap }    from '@angular/platform-browser-dynamic';
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';

import { AppComponent } from './app.component';
// import {disableDeprecatedForms, provideForms} from '@angular/forms';
// import {HTTP_PROVIDERS} from '@angular/http';
import { AppModule } from './app.module';
import {PLATFORM_DIRECTIVES,provide,Input,Directive,HostBinding} from '@angular/core';

platformBrowserDynamic().bootstrapModule(AppModule);


// bootstrap(AppComponent,[
//    disableDeprecatedForms(), 
//    provideForms(),
//    HTTP_PROVIDERS
// ]);

// @Directive({
//   selector:'[layout]'
// })
// export class LayoutDirective{
//   @Input() layout:string;
//   @HostBinding('style.display') display = 'flex';

//   @HostBinding('style.flex-direction')
//   get direction(){
//        return (this.layout === 'column') ? 'column':'row';
//   }
// }
// @Directive({
//   selector:'[flex]'
// })
// export class FlexDirective{
//     @Input() shrink:number = 1;
//     @Input() grow:number = 1;
//     @Input() flex:string;

//     @HostBinding('style.flex')
//     get style(){
//         return `${this.grow} ${this.shrink} ${this.flex === '' ? '0':this.flex}%`;
//     }
// }



// bootstrap(AppComponent,[
//     provide(PLATFORM_DIRECTIVES, { useValue: FlexDirective, multi: true}),
//     provide(PLATFORM_DIRECTIVES, { useValue: LayoutDirective, multi: true})
// ]);