var num = [1,2,3]

/*for ( var i = 0 ; i < num.length;i++) {
    console.log(num[i])
}*/

num.forEach( function(number){ console.log(number)})

num.forEach ( function(number, i) {
    num[i] = number * 2;
    console.log(num[i]);

})