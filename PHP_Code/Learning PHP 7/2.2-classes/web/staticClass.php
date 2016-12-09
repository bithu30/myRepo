<?php

class MyStaticClass
{
    public static $message = 'Hi ';

    public static function getMessage(): string
    {
        return self::$message;
    }

    public static function helloSomeone(string $name): string
    {
        return self::getMessage() . $name; // executes the method helloMessage()
    }
}

echo MyStaticClass::$message; // echoes Hi
MyStaticClass::helloSomeone('Nicola'); // echoes Hi Nicola