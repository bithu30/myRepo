<?php
trait RunTrait
{
    public function run(): string
    {
        return 'I run fast';
    }
}

interface Runner
{
    public function run(): string;
}

class MrBrown implements Runner
{
    use RunTrait;
}

$mrBrown = new MrBrown();
echo $mrBrown->run();

$myFriend = new class() implements Runner
{
    use RunTrait;
};

echo $myFriend->run();
