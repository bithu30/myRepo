<?php
namespace App\Traits;

use Symfony\Component\HttpFoundation\Response;

use Symfony\Component\Validator\Constraints as Assert;

trait CreateFormTrait
{
    private function createForm(string $template): Response
    {
        $errors = $this->session->getBag('flashes')->get('errors');

        return new Response(
            $this->twig->render($template,
                ['token' => $this->form->getToken(), 'errors' => $errors]
            )
        );
    }
}