function myFilter(my_array, callback){
    //Enter your code here
   var arr = [];
   for ( var index in my_array) {
   		arr.push(my_array[index],callback)
   }

   return arr;
}

inputArray = [4,5,6,7,8,9];

function processData(inputArray) {
    //In blank write anonymous function, which takes one parameter and returns true if its even or false if its odd.
    console.log(myFilter(inputArray, (x) => (x%2 ===0) );   
} 