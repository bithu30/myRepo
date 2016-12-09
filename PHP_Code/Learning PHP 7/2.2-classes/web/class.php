<?php

class MyClass
{
    public $message;

    public function __construct(string $message = 'Hi ')
    {
        $this->message = $message;
    }

    public function getMessage(): string
    {
        return $this->message;
    }

    public function helloSomeone(string $name): string
    {
        return $this->getMessage() . $name; // executes the method helloMessage()
    }
}

$myObject = new MyClass('Hello '); //class construction
echo $myObject->message; // echoes Hello
echo $myObject->helloSomeone('Nicola'); // echoes Hello Nicola

$myOtherObject = new MyClass(); //class construction
echo $myOtherObject->message; // echoes Hi
echo $myOtherObject->helloSomeone('PHP'); // echoes Hi PHP
