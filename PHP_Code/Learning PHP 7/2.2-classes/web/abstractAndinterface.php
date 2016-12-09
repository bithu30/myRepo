<?php
interface Runner
{
    public function run(): string;
}

abstract class Person
{
    protected $name;

    public function __consruct(string $name)
    {
        $this->name = $name;
    }

    public function getName(): string
    {
        return $this->name;
    }

    abstract protected function walk(): string;
}

class Dad extends Person implements Runner
{
    public function walk(): string
    {
        return 'I walk well';
    }

    public function run(): string
    {
        return 'I run fast';
    }
}
