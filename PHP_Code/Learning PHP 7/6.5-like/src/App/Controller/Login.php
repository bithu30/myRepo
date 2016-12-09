<?php
namespace App\Controller;

use App\Form\FormValidatorInterface;
use App\Traits\{
    CreateFormTrait,
    FlashMessagesTrait
};
use App\Session\UserSessionInterface;
use Psr\Log\LoggerInterface;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\HttpFoundation\{
    RedirectResponse,
    Request,
    Response,
    Session\SessionInterface
};
use Doctrine\ORM\EntityManagerInterface;
use App\Password\HasherInterface;

class Login
{
    use CreateFormTrait, FlashMessagesTrait;

    private $twig;
    private $log;
    private $session;
    private $urlGenerator;
    private $em;
    private $hasher;
    private $form;

    public function __construct(
        \Twig_Environment $twig,
        LoggerInterface $log,
        SessionInterface $session,
        UrlGeneratorInterface $urlGenerator,
        EntityManagerInterface $em,
        HasherInterface $hasher,
        FormValidatorInterface $form,
        UserSessionInterface $userSession
    )
    {
        $this->twig = $twig;
        $this->log = $log;
        $this->session = $session;
        $this->urlGenerator = $urlGenerator;
        $this->em = $em;
        $this->hasher = $hasher;
        $this->form = $form;
        $this->userSession = $userSession;
    }

    public function showFormAction(): Response
    {
        return $this->createForm('login.html.twig');
    }

    public function loginCheckAction(Request $request): Response
    {
        if ($this->form->isValid($request)) {
            if ($this->areCredentialsValid($request->get('email'), $request->get('password'))) {

                return new RedirectResponse(
                    $this->urlGenerator->generate('home')
                );
            }
            $this->form->addError('Wrong credentials.');
        }
        $this->setFlashMessages('errors', $this->form->getErrors());

        $this->log->debug('Errors in form');

        return new RedirectResponse(
            $this->urlGenerator->generate('login')
        );
    }

    public function logoutAction(): Response
    {
        $this->session->clear();

        return new RedirectResponse(
            $this->urlGenerator->generate('login')
        );
    }

    private function areCredentialsValid(string $email, string $password): bool
    {
        $user = $this->em->getRepository('App\Model\User')->findOneByEmail($email);
        if ($user) {
            if ($this->hasher->isPasswordValid($password, $user->getPassword())) {
                $this->userSession->setUser($user);

                return true;
            }
        }

        return false;
    }
}
