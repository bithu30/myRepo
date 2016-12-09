<?php
namespace App\Controller;

use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Psr\Log\LoggerInterface;
use Doctrine\ORM\EntityManagerInterface;

class Homepage
{
    private $twig;
    private $log;
    private $em;
    private $itemPerPage;

    public function __construct(
        \Twig_Environment $twig,
        LoggerInterface $log,
        EntityManagerInterface $em,
        int $itemPerPage
    )
    {
        $this->twig = $twig;
        $this->log = $log;
        $this->em = $em;
        $this->itemPerPage = $itemPerPage;
    }

    public function indexAction(): Response
    {
        $posts = $this->getPosts(1);

        return new Response(
            $this->twig->render('index.html.twig',
                array(
                'posts' => $posts
                )
            )
        );
    }

    public function nextPageAction($page): Response
    {
        $posts = $this->getPosts($page);

        return new Response(
            $this->twig->render('posts_list.html.twig',
                array(
                    'posts' => $posts
                )
            )
        );
    }

    private function getPosts(int $page) : array
    {
        return  $posts = $this->em->getRepository('App\Model\Post')->findBy(
            [],
            ['id'=> 'DESC'],
            $this->itemPerPage,
            $this->itemPerPage * ($page - 1)
        );
    }
}
