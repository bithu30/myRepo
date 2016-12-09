<?php
namespace App\Controller;

use App\Session\UserSessionInterface;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\{
    Response,
    Session\SessionInterface
};

class Dashboard
{
    private $twig;
    private $session;
    private $userSession;
    private $em;

    public function __construct(
        \Twig_Environment $twig,
        SessionInterface $session,
        UserSessionInterface $userSession,
        EntityManagerInterface $em
    )
    {
        $this->twig = $twig;
        $this->session = $session;
        $this->userSession = $userSession;
        $this->em = $em;
    }

    public function indexAction(): Response
    {
        $user = $this->userSession->getUser();
        $posts = $this->em->getRepository('App\Model\Post')
            ->findByUser(
                $user->getId(),
                ['id'=> 'DESC']
            );

        return new Response(
            $this->twig->render('dashboard.html.twig',
                array(
                'posts' => $posts
                )
            )
        );
    }
}
