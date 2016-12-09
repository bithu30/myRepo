<?php
namespace App\Session;

use App\Model\User;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

interface UserSessionInterface
{
    public function setUser(User $user);
    public function hasRole(string $role): bool;
    public function getUser(): User;
}