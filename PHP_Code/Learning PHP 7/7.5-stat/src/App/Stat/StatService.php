<?php

namespace App\Stat;

use App\Model\User;
use App\Model\Visit;
use App\Session\UserSessionInterface;
use Doctrine\ORM\EntityManagerInterface;

class StatService
{
    private $em;
    private $userSession;

    public function __construct(
        EntityManagerInterface $em,
        UserSessionInterface $userSession
    )
    {
        $this->em = $em;
        $this->userSession = $userSession;
    }

    public function saveStat()
    {
        $user = $this->em->find('App\Model\User', $this->userSession->getUser()->getId());
        $this->saveUserVisit($user);
    }

    private function saveUserVisit(User $user)
    {
        $today = new \DateTime('now');
        $dbVisit = $this->em->getRepository('App\Model\Visit')
            ->findOneBy(['user' => $user, 'date' => $today]);
        if (!$dbVisit) {
            $visit = new Visit();
            $visit->setDate($today);
            $visit->setUser($user);

            $this->em->persist($visit);
            $this->em->flush();
        }
    }
}