<?php

// Given an interface
interface Message
{
    public function getMessage(): string;
}

// And a sample class
class OutputMessage
{
    public function sendMessage(Message $message)
    {
        echo $message->getMessage();
    }
}
$output = new OutputMessage();

// You can quickly call the sendMessage method with an anonymous class
$output->sendMessage(new class implements Message{
    public function getMessage(): string
    {
        return 'Hello!';
    }
});

// Another example of anonymous class
(new class {

    public function runFast()
    {
        echo 'I like PHP 7';
    }

})->runFast();