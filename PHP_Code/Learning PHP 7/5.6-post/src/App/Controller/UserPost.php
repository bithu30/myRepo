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
use App\Traits\{
    CreateFormTrait,
    FlashMessagesTrait
};

class UserPost
{
    use CreateFormTrait, FlashMessagesTrait;

    private $twig;
    private $urlGenerator;
    private $em;
    private $session;
    private $userSession;
    private $form;

    public function __construct(
        \Twig_Environment $twig,
        UrlGeneratorInterface $urlGenerator,
        EntityManagerInterface $em,
        SessionInterface $session,
        UserSessionInterface $userSession,
        FormValidatorInterface $form
    )
    {
        $this->twig = $twig;
        $this->urlGenerator = $urlGenerator;
        $this->em = $em;
        $this->session = $session;
        $this->userSession = $userSession;
        $this->form = $form;
    }

    public function showPostFormAction(): Response
    {
        return $this->createForm('post_form.html.twig');
    }

    public function submitPostAction(Request $request): Response
    {
        if ($this->form->isValid($request)) {

            $post = new Post();
            $user = $this->userSession->getUser($this->session);
            $user = $this->em->find("App\Model\User", $user->getId());
            $post->setUser($user);
            $post->setTitle($request->get('title'));
            $post->setDescription($request->get('description'));
            $post->setPostedAt(new \DateTime('now'));
            $this->em->persist($post);
            $this->em->flush();

            return new Response($this->twig->render('post_success.html.twig'));

        }

        $this->setFlashMessages('errors', $this->form->getErrors());

        return new RedirectResponse(
            $this->urlGenerator->generate('post')
        );
    }
}