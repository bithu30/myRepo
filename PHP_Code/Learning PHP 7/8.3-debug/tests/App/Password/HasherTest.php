<?php
namespace App\Tests\Password;

use App\Password\{
    Hasher,
    HasherInterface
};

class HasherTest extends \PHPUnit_Framework_TestCase
{
    private $hasher;

    public function setUp()
    {
        $this->hasher = new Hasher();
    }

    public function testHasherCreation()
    {
        $this->assertInstanceOf(HasherInterface::class, $this->hasher);
    }

    public function testhashPassowrd()
    {
        $password = 'one';
        $result = $this->hasher->hashPassword($password);

        $this->assertTrue(password_verify($password, $result));
    }

    public function testIsPasswordValid()
    {
        $password = 'two';
        $passwordHash = password_hash($password, PASSWORD_DEFAULT);
        $isPasswordValid = $this->hasher->isPasswordValid($password, $passwordHash);

        $this->assertTrue($isPasswordValid);
    }
}
