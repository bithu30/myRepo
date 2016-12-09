<?php
$myArray = ['firstValue', 'secondValue', 'thirdValue'];
$myArray = ['first' => 'firstValue', 'second' => 'secondValue', 'third' => 'thirdValue'];
$myArrayA = array(
    "foo" => "fooContent",
    "bar" => "barContent"
);

//syntax valid from PHP 5.4
$myArrayB = [
    "foo" => "fooContent",
    "bar" => "barContent"
];

//with the PHP 5.4 style you could leave the trailing comma
$multiArray1 = [
    "a" => $myArrayA,
    "b" => $myArrayA,
];
$multiArray2 = [
    ['green', 'blue'],
    ['yellow', 'red', 'black']
];
echo $myArrayB["foo"]; //fooContent
echo $myArrayB["bar"]; //barContent

echo $multiArray2[0][1]; //blue
echo $multiArray2[1][2]; //black
