var num = [1,2,3]

/*for ( var i = 0 ; i < num.length;i++) {
    console.log(num[i])
}*/

//num.forEach( function(number){ console.log(number)})

/*num.forEach ( function(number, i) {
    num[i] = number * 2;
    console.log(num[i]);

})*/

var newNum = num.map( function(number){
    return number * 2

})

var evens = num.filter( function(number){
    
     return number % 2 == 0 
    

})
//chaining

var res = num.filter( function(number){
    
     return number % 2 == 0 
    

}).map( function (number) {
    return number * 100
})

/*console.log(evens)
console.log(res)*/

var sum = num.reduce(function(memo,val){
    return memo+val
},0)
console.log(sum)