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
        return new Response(
            $this->twig->render('index.html.twig')
        );
    }
}
