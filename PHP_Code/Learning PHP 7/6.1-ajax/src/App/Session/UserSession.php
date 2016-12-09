<?php
namespace App\Session;

use App\Model\User;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class UserSession implements UserSessionInterface
{
    private $session;

    const SESSION_TOKEN = 'myapp';

    public function __construct(SessionInterface $session)
    {
        $this->session = $session;
    }


    public function setUser(User $user)
    {
        $this->session->set(self::SESSION_TOKEN, serialize($user));
    }

    public function hasRole(string $role): bool
    {
        if ($user = $this->getUser()) {

            return $user->getRole() == $role;
        }

        return false;
    }

    public function getUser(): User
    {
        if ($serializedSession = $this->session->get(self::SESSION_TOKEN)) {
            $user = unserialize($serializedSession);

            return $user;
        }

        return new User();
    }
}