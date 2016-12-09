<?php
class Dad
{
    protected $name;
    protected $surname;

    public function __consruct(string $name, string $surname)
    {
        $this->name = $name;
        $this->surname = $surname;
    }

    public function run()
    {
        echo 'I run fast';
    }

    private function drive()
    {
        echo 'I drive a car';
    }
}

class Son extends Dad
{
    public function goToSchool()
    {
        echo 'I go to school';
    }

    public function whatIsMyName()
    {
        echo $this->name;
    }
}

$son = new Son('Nick', 'Long');
$son->run(); //will output I run fast
$son->goToSchool(); //will output I go to school
$son->drive(); //produces an error
$son->whatIsMyName(); //will ouput  Nick
