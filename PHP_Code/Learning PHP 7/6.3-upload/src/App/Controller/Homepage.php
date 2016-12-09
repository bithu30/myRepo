<?php
namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Psr\Log\LoggerInterface;
use Doctrine\ORM\EntityManagerInterface;

class Homepage
{
    private $twig;
    private $log;
    private $em;

    public function __construct(
        \Twig_Environment $twig,
        LoggerInterface $log,
        EntityManagerInterface $em
    )
    {
        $this->twig = $twig;
        $this->log = $log;
        $this->em = $em;
    }

    public function indexAction(): Response
    {
        $posts = $this->getPosts();

        return new Response(
            $this->twig->render('index.html.twig',
                array(
                'posts' => $posts
                )
            )
        );
    }

    private function getPosts() : array
    {
        return  $posts = $this->em->getRepository('App\Model\Post')->findAll();
    }
}
