<?php
$exampleArray = ['horse', 'dog', 'cat', 'tiger'];

array_pop($exampleArray); // I remove tiger

array_push($exampleArray, "lion"); // I add lion

in_array("lion", $exampleArray); //check if lion is present

$keys = array_keys($exampleArray);

$elementCount = count($exampleArray);

sort($exampleArray); //sort in alphabetical order

echo 'The result of pop, push and sort is:';
print_r($exampleArray);

/*
The result of pop, push and sort is:Array
(
    [0] => cat
    [1] => dog
    [2] => horse
    [3] => lion
)
*/
