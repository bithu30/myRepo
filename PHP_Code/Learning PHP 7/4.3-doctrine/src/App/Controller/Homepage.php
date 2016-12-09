<?php
namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Psr\Log\LoggerInterface;

class Homepage
{
    private $twig;
    private $log;

    public function __construct(\Twig_Environment $twig, LoggerInterface $log)
    {
        $this->twig = $twig;
        $this->log = $log;
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
        $postA =
            [
                'title' => 'first article',
                'description' => 'first description',
                'image' => 'http://placehold.it/600x270',
                'likes' => 1,
                'comments' => 1
            ];

        $postB =
            [
                'title' => 'second article',
                'description' => 'second description',
                'image' => 'http://placehold.it/600x270',
                'likes' => 2,
                'comments' => 2
            ];

        return [ $postA, $postB ];
    }
}
