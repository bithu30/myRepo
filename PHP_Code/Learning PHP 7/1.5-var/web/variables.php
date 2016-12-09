<?php

$I_am_Integer = 5985;
$I_am_Float = 10.365; //float
$I_am_boolen = true;
$I_am_string = 'Hello';
$I_am_an_array = array("first","secoond","third");
$I_am_an_arrayToo = ['first','secoond','third'];
$I_am_an_object = new \StdClass();
$I_am_null =null;

//PHP converts the variable according to the correct data type
$a = '1';
$b = '2';
$result = $a + $b;


//constant
define("MY_CONSTANT", "something");
const MY_OTHER_CONSTANT = 'whatever';

//Some operators:
$substract = $a - $b;
$multiply = $a * $b;
$division = $a / $b;
$modulus = $a % $b;
$power = $a ** $b;

$firstString = 'Good ';
$secondString = 'Morning';
echo $concatenation = $firstString . $secondString;

($a == $b); //Equal
($a === 1); //Identical
($a != $b); //Not Equal
($a >= $b); //greater or equal

$x++; // equal to: $x = $x + 1
