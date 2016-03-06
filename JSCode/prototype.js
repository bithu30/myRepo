function Square(A, B, C, D){
    this.A = A;
    this.B = B;
    this.C = C;
    this.D = D;
}
//Write Your Code Below This Line
/*Square.prototype.isSquare = function () {

	if ( this.A == this.B == this.C == this.D) {
		return true;
	} else {
		return false;
	}
}*/

Square.prototype.isSquare = function() {
console.log(this.A === this.B && this.B === this.C && this.C === this.D);
};


//Don't Edit Code Below This Line
var input = [1,1,1,1];
function processData(input) {
    var sq1 = new Square(input[0], input[1], input[2], input[3]);
    console.log(sq1.isSquare());
    
    console.log(Object.getPrototypeOf(sq1));
} 
