<?php
namespace App\Controller;

use App\Model\User;
use App\Model\UserRole;
use App\Password\HasherInterface;
use Psr\Log\LoggerInterface;
use Symfony\Component\{
    Routing\Generator\UrlGeneratorInterface,
    Security\Csrf\CsrfTokenManagerInterface
};
use Symfony\Component\HttpFoundation\{
    RedirectResponse,
    Request,
    Response,
    Session\SessionInterface
};
use Symfony\Component\Security\Csrf\CsrfToken;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Doctrine\ORM\EntityManagerInterface;
use App\Traits\UserFormTraits;
use Symfony\Component\Validator\Constraints as Assert;

class SignUp
{
    private $twig;
    private $log;
    private $csrfProvider;
    private $session;
    private $urlGenerator;
    private $validator;
    private $em;
    private $hasher;

    public function __construct(
        \Twig_Environment $twig,
        LoggerInterface $log,
        CsrfTokenManagerInterface $csrfProvider,
        SessionInterface $session,
        UrlGeneratorInterface $urlGenerator,
        ValidatorInterface $validator,
        EntityManagerInterface $em,
        HasherInterface $hasher
    )
    {
        $this->twig = $twig;
        $this->log = $log;
        $this->csrfProvider = $csrfProvider;
        $this->session = $session;
        $this->urlGenerator = $urlGenerator;
        $this->validator = $validator;
        $this->em = $em;
        $this->hasher = $hasher;
    }

    public function showFormAction(): Response
    {
        $csrfToken = $this->csrfProvider->refreshToken('token');
        $errors = $this->session->getBag('flashes')->get('errors');

        return new Response(
            $this->twig->render('signup.html.twig',
                ['token' => $csrfToken, 'errors' => $errors]
            )
        );
    }

    public function userRegistrationAction(Request $request): Response
    {
        if ($this->isTokenValid('token', $request)) {
            $errors = $this->validateInputs($request);
            if (count($errors) == 0) {
                $email = $request->get('email');
                $user = $this->em->getRepository('App\Model\User')->findOneByEmail($email);

                if ($user) {
                    $errors[] = 'Email already present.';
                } else {
                    $this->insertUser($request);

                    return new RedirectResponse(
                        $this->urlGenerator->generate('home')
                    );
                }
            }
            $this->setFlashErrors($errors);
        }

        $this->log->debug('token or request not valid');

        return new RedirectResponse(
            $this->urlGenerator->generate('signup')
        );
    }

    private function isTokenValid(string $tokenId, Request $request): bool
    {
        if ($this->csrfProvider->isTokenValid(new CsrfToken($tokenId, $request->get($tokenId)))) {

            return true;
        }

        return false;
    }

    private function validateInputs(Request $request): array
    {
        $email = $request->get('email');
        $password = $request->get('password');

        $errors = array();
        $errors[] = $this->validator->validateValue(
            $email,
            new Assert\NotBlank(array('message' => 'The email should not be blank'))
        );
        $errors[] = $this->validator->validateValue(
            $email,
            new Assert\Email(array('message' => 'Please provide a valid email address'))
        );
        $errors[] = $this->validator->validateValue(
            $password,
            new Assert\NotBlank(array('message' => 'The password should not be blank'))
        );

        $errorMessages = array();
        foreach ($errors as $error) {
            if (count($error) > 0) {
                $errorMessages[] =  $error->get(0)->getMessage();
            }
        }

        return $errorMessages;
    }

    private function insertUser(Request $request)
    {
        $email = $request->get('email');
        $password = $request->get('password');
        $user = new User();
        $user->setEmail($email);
        $user->setPassword($this->hasher->hashPassword($password));
        $this->em->persist($user);
        $this->em->flush();
    }

    private function setFlashErrors(array $errors)
    {
        foreach ($errors as $error) {
            $this->session->getBag('flashes')->add('errors', $error);
        }
    }

}
