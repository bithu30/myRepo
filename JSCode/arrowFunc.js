//arrow function
var digits = new Array(1,2,3,4,5);
var my_function = (digits) => digits.map( (item) => item % 2 === 0? ++item: --item);
