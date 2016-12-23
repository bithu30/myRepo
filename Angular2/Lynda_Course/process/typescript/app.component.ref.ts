import {Component} from 'angular2/core';

@Component({

    selector:'my-app',
    templateUrl:'partials/app.html'
   

})

export class AppComponent {
    name : string;
    artists: string [];
    artistsObj:any;

    constructor () {
        this.name = 'Bijith';
        this.artists = ['K J Yesudas','SPB' ];
        this.artistsObj = [
            {
                'name':'Bala Murali Krishna',
                'school':'Karnatic'
            },
             {
                'name':'Ustaad Zakir Hussain',
                'school':'Hindustani'
            },
             {
                'name':'Usha Utup',
                'school':'Indipop'
            }


        ];
    }
}