function makeAdder(x) {

    function add ( y) {
        return y+x;
    };
    return add;
}

var plusTen = makeAdder(10);
var plus100 = makeAdder(100);

console.log(plusTen(5));
console.log(plus100(50));