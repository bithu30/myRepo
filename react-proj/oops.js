/*
any object search for function and variables first in
the object def and then in its prototype
*/

//'use strict'

//console.log(Person.prototype)

function Person(name,age) {
    this.name = name
    this.age = age

}

//console.log(Person.prototype)

Person.prototype.sayHello=  function() {console.log("Hello "+this.name)}
//console.log(Person.prototype)
p1 = new Person("Bijith",40)
//p1.sayHello()

var sayHello = p1.sayHello
sayHello.call({'name':'Seethu'})
//sayHello.apply(p1,['hello'])
var boundSayHello = sayHello.bind(p1)
boundSayHello()