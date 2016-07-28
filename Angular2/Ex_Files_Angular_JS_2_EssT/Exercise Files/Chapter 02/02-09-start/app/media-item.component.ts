import {Component, Input} from 'angular2/core';

@Component({
    selector: 'media-item',
    templateUrl: 'app/media-item.component.html',
    styleUrls: ['app/media-item.component.css']
})
export class MediaItemComponent {
    @Input() mediaItem;
    onDelete() {
        console.log('deleted');
    }
}