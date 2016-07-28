import {Directive, HostBinding, Input, HostListener} from 'angular2/core';

@Directive({
    selector: '[mwFavorite]'
})
export class FavoriteDirective {
    @HostBinding('class.is-favorite') isFavorite = true;
    @HostBinding('class.is-favorite-hovering') hovering = false;
    @Input()
    set mwFavorite(value) {
        this.isFavorite = value;
    }

    @HostListener('mouseenter')
    onMouseEnter() {
        this.hovering = true;

    }

    @HostListener('mouseleave')
    onMouseLeave() {
        this.hovering = false;
    }
}