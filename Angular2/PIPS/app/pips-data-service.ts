
export class PipsDataService {

    pipsData = [];
     add(val) {
         return this.pipsData.push(val)
     }
     get() {
         return this.pipsData;
     }
     show(){
         
         console.log(this.pipsData );
         
     }
     

}