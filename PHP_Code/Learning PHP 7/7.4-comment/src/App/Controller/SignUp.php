<?php
namespace App\Controller;

use App\Form\FormValidatorInterface;
use App\Form\SignUpForm;
use App\Model\{
    User,
    UserRole
};
use App\Password\HasherInterface;
use Psr\Log\LoggerInterface;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\HttpFoundation\{
    RedirectResponse,
    Request,
    Response,
    Session\SessionInterface
};
use Doctrine\ORM\EntityManagerInterface;
use App\Traits\{
    CreateFormTrait,
    FlashMessagesTrait
};

class SignUp
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
        FormValidatorInterface $form
    )
    {
        $this->twig = $twig;
        $this->log = $log;
        $this->session = $session;
        $this->urlGenerator = $urlGenerator;
        $this->em = $em;
        $this->hasher = $hasher;
        $this->form = $form;
    }

    public function showFormAction(): Response
    {
        return $this->createForm('signup.html.twig');
    }

    public function userRegistrationAction(Request $request): Response
    {
        if ($this->form->isValid($request)) {
            $email = $request->get('email');
            $user = $this->em->getRepository('App\Model\User')->findOneByEmail($email);
            if ($user) {
                $this->form->addError('Email already present.');
            } else {
                try {
                    $this->insertUser($request);

                    return new RedirectResponse(
                        $this->urlGenerator->generate('home')
                    );
                } catch (\Throwable $t) {
                    $this->log->error(sprintf('%s: %s',__CLASS__, $t->getMessage()));
                    $this->form->addError('Oops. Something went wrong. Please try again later.');
                }

            }
        }
        $this->setFlashMessages('errors', $this->form->getErrors());

        $this->log->debug('Errors in form');

        return new RedirectResponse(
            $this->urlGenerator->generate('signup')
        );
    }

    private function insertUser(Request $request)
    {
        $email = $request->get('email');
        $password = $request->get('password');
        $user = new User();
        $user->setEmail($email);
        $user->setPassword($this->hasher->hashPassword($password));
        $user->setRole(UserRole::ROLE_USER);
        $this->em->persist($user);
        $this->em->flush();
    }

}
