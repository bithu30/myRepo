// VALUES AND VARIABLES

// You start off by defining your variable or value

// General Format
val <name>: <type> = <literal>
var <name>: <type> = <literal>

// var or val determines whether it is a variable or a value
// Values (val) are Immutable
// Variables (var) can be reassigned.

// name: is your chosen name of the object
// examples: my_num , bank_account, chips

// type: Is the data type
// examples: Int, Double, String, Boolean
// We will introduce more types later on

// literal: What you are actually trying to assign
// examples: 11, 2.5, "hello", true

// Let's see some REPL examples!

scala> var myvar: Int = 10
myvar: Int = 10

scala> val myval: Double = 2.5
myval: Double = 2.5

// Reassignments

// Fails for different data type
scala> myvar = "hello"
<console>:12: error: type mismatch;
 found   : String("hello")
 required: Int
       myvar = "hello"

// Works for same data type and being a var
scala> myvar = 200
myvar: Int = 200

// Values can not be reassigned!
scala> myval = 2.5
<console>:12: error: reassignment to val
       myval = 2.5

 // Quick Check, what can be reassigned, val or var?

// Creating variables and values without types:

// Scala can infer data types
scala> val c = 12
c: Int = 12

scala> val s = "my string"
s: String = my string

// Valid Names
scala> val my_string = "Hello"
my_string: String = Hello

// Not Recommended, but possible
scala> val `my.string` = "hello"
my.string: String = hello

// InValid Names
scala> val 2strings = "hello hello"
<console>:1: error: Invalid literal number
val 2strings = "hello hello"

scala> val my.string = "hello"
<console>:11: error: not found: value my
       val my.string = "hello"
