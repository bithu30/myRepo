<?php
namespace App\Password;

class Hasher implements HasherInterface
{
    public function hashPassword(string $value): string
    {
        return password_hash($value, PASSWORD_DEFAULT);
    }

    public function isPasswordValid(string $value, string $hashedValue): bool
    {
        return password_verify($value, $hashedValue);
    }
}