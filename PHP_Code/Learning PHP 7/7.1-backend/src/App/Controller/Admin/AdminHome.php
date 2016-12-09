<?php
namespace App\Controller\Admin;

use Symfony\Component\HttpFoundation\Response;

class AdminHome
{
    private $twig;

    public function __construct(\Twig_Environment $twig)
    {
        $this->twig = $twig;
    }

    public function indexAction(): Response
    {
        return new Response(
            $this->twig->render('admin/admin_index.html.twig')
        );
    }
}
