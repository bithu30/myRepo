// WHILE LOOPS

// While loops repeat code while some condition it true

// Needs to be var, we will reassign
var x = 0

while(x < 5){
  println(s"x is currently $x")
  println("x is still less than 5, adding 1 to x")
  x = x+1
}

// Break
// Scala doesn't have built-in break functionality
// Allows you to break out of a loop based on some condition
import util.control.Breaks._

var y = 0

while(y < 10){
  println(s"y is currently $y")
  println("y is still less than 10, adding 1 to y")
  y = y+1
  if(y == 3) break
}
