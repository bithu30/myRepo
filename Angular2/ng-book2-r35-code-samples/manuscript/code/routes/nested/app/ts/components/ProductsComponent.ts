/*
 * Angular
 */
import {Component} from '@angular/core';
import {
  ActivatedRoute,
  ROUTER_DIRECTIVES,
  Router,
  RouterConfig
} from '@angular/router';

/*
 * Components
 */
import {MainComponent} from 'components/products/MainComponent';
import {InterestComponent} from 'components/products/InterestComponent';
import {SportifyComponent} from 'components/products/SportifyComponent';
import {ByIdComponent} from 'components/products/ByIdComponent';

@Component({
  selector: 'products',
  directives: [ROUTER_DIRECTIVES],
  template: `
  <h2>Products</h2>

  <div class="navLinks">
    <a [routerLink]="['./main']">Main</a> |
    <a [routerLink]="['./interest']">Interest</a> |
    <a [routerLink]="['./sportify']">Sportify</a> |
    Enter id: <input #id size="6">
    <button (click)="goToProduct(id.value)">Go</button>
  </div>

  <div class="products-area">
    <router-outlet></router-outlet>
  </div>
  `
})

export class ProductsComponent {
  constructor(private router: Router, private route: ActivatedRoute) {
  }

  goToProduct(id:string): void {
    this.router.navigate(['./', id], {relativeTo: this.route});
  }
}

export const routes: RouterConfig = [
  { path: '', redirectTo: 'main' },
  { path: 'main', component: MainComponent },
  { path: ':id', component: ByIdComponent },
  { path: 'interest', component: InterestComponent },
  { path: 'sportify', component: SportifyComponent },
];
