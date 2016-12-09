<?php
//declare(strict_types=1);

function hello()
{
    echo 'hello';
}

function sum(int $a, int $b): int
{
    return $a + $b;
}

//echo sum(2, 3);
//echo sum('2', 3);

/**
 * Problem: Given an input string in uppercase or lowercase
 * we want to create a function that return the same string with various style:
 * - uppercase = 'ILOVEPHP'
 * - lowercase = 'ilovephp'
 * - funny style = 'IlOvEpHp'
 */

function funnyStyle(string $message, string $style): string
{
    switch($style) {
        case 'uppercase':
            return strtoupper($message);
        case 'lowercase':
            return strtolower($message);
        case 'funny':
            return applyFunnyStyle($message);
        default:
            return "I don't know this options";
    }
}

function applyFunnyStyle(string $message): string
{
    for($i=0; $i<strlen($message); $i++)
    {
        if ($i % 2 == 0) {
            $message[$i] = strtoupper($message[$i]);
        } else {
            $message[$i] = strtolower($message[$i]);
        }
    }

    return $message;
}

echo funnyStyle('iLovePHP ', 'lowercase');
echo funnyStyle('iLovePHP ', 'uppercase');
echo funnyStyle('ilovephp ', 'funny');

$myVarFunction = 'funnyStyle';

echo $myVarFunction('iLovePHP ', 'lowercase');

/**
 * Anonymous function/closures
 */
$anonym = function () {
    echo 'hello';
};
$anonym();

$message = 'hello';

// use the $message var in the closure
$myClosure = function () use ($message) {
    echo $message;
};
$myClosure();

// Closures can accept arguments
$helloPHP = function ($arg) use ($message) {
    echo $message . ' ' . $arg;
};
$helloPHP("PHP");