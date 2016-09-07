"use strict";
var platform_browser_dynamic_1 = require('@angular/platform-browser-dynamic');
// import {disableDeprecatedForms, provideForms} from '@angular/forms';
// import {HTTP_PROVIDERS} from '@angular/http';
var app_module_1 = require('./app.module');
platform_browser_dynamic_1.platformBrowserDynamic().bootstrapModule(app_module_1.AppModule);
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
//# sourceMappingURL=main.js.map