import {Injectable} from '@angular/core'
import {Http, Response, Headers, RequestOptions} from '@angular/http';
import {Observable} from 'rxjs/Rx';
import 'rxjs/Rx';


@Injectable()
export class PipsDataService {

    constructor(private http: Http) { }
    
    public  pipsData = [];
    private out;
     add( val: any) {
         return this.pipsData.push(val);
     }
     get() {
         return this.pipsData;
     }
     show(){
         
         console.log(this.pipsData );
         
     }
     private extractData(res:Response) {
         console.log(res);
         return res;
     }
     private takeOutData(data) {
         console.log("From Subscribe:"+data._body);
         this.out = data._body;
         console.log(this.out)
     }
     submitData() {
         console.log(JSON.stringify( this.pipsData ) );
         console.log("Going to send formdata for processing");
         var out = [];
         let headers = new Headers({ 'Content-Type': 'application/json' });
         let options = new RequestOptions({ headers: headers });
        
         var url = 'http://pips.ucc.ie/test/test.php'; 
         this.http.post(url, JSON.stringify(this.pipsData),headers).map(this.extractData)
          .subscribe(
              data => this.takeOutData(data),
                  err => console.error(err),
                   () => console.log('done')
         	);
             
             //window.setInterval(10000000);
     }

}