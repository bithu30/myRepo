<?php

namespace App\Controller;

use App\Form\FormValidatorInterface;
use App\Model\Post;
use App\Session\UserSessionInterface;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\HttpFoundation\{
    Request,
    Response,
    RedirectResponse,
    Session\SessionInterface
};
use Doctrine\ORM\EntityManagerInterface;

class UserPost
{
    private $twig;
    private $urlGenerator;
    private $em;
    private $userSession;
    private $form;

    public function __construct(
        \Twig_Environment $twig,
        UrlGeneratorInterface $urlGenerator,
        EntityManagerInterface $em,
        UserSessionInterface $userSession,
        FormValidatorInterface $form
    )
    {
        $this->twig = $twig;
        $this->urlGenerator = $urlGenerator;
        $this->em = $em;
        $this->userSession = $userSession;
        $this->form = $form;
    }

    public function submitPostAction(Request $request): Response
    {
        if ($this->form->isValid($request)) {
            $post = $this->savePost($request);

            return new Response (
                $this->twig->render(
                    'post.html.twig',
                    ['post' => $post]
                ), 201
            );
        }

        return new Response(implode('<BR/>',$this->form->getErrors()), 400);
    }

    private function savePost($request): Post
    {
        $post = new Post();
        $user = $this->userSession->getUser();
        $user = $this->em->find("App\Model\User", $user->getId());
        $post->setUser($user);
        $post->setTitle($request->get('title'));
        $post->setDescription($request->get('description'));
        $post->setPostedAt(new \DateTime('now'));
        $this->em->persist($post);
        $this->em->flush();

        return $post;
    }
}
