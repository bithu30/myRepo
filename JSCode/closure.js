function multiplier(x) {
  this.func =  function ( y) {
  					return x * y;
  				};
  //console.log(this.func);
  return this.func;
}

var func1 = multiplier(8);
console.log(func1(10));
/*
var input = 8;
function processData(input) {
    var waterWeight = multiplier(1);
    console.log(waterWeight);
    var mercuryWeight = multiplier(1.355);
    var oilWeight = multiplier(0.900);
    
    console.log("Weight of " + input + " metric cube of water = " + waterWeight(input) + " kg");
    console.log("Weight of " + input + " metric cube of mercury = " + mercuryWeight(input) + " kg");
    console.log("Weight of " + input + " metric cube of oil = " + oilWeight(input) + " kg");
} 
*/
