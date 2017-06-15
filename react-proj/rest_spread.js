function add () {
    console.log(arguments)
    var res = Array.prototype.reduce.call(arguments,function(memo,value){
        return memo+value;
    })
    return res;
}
console.log(add(1,2,3));

function betterAdd(...values){
    console.log(values)
   var result =  values.reduce(function(memo,val){
        return memo+val
    })
    return result
}
console.log(betterAdd(1,2,3))