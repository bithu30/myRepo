<?php
namespace App\Form;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Csrf\CsrfToken;
use Symfony\Component\Security\Csrf\CsrfTokenManagerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Component\Validator\Constraint;

abstract class FormValidator implements FormValidatorInterface
{
    protected $csrfProvider;
    protected $validator;
    protected $errors;
    protected $assertions;
    const TOKEN_NAME = 'token';

    public function __construct(
        CsrfTokenManagerInterface $csrfProvider,
        ValidatorInterface $validator
    )
    {
        $this->csrfProvider = $csrfProvider;
        $this->validator = $validator;
        $this->errors = [];
        $this->assertions = [];
    }

    public function addError(string $error)
    {
        $this->errors[] = $error;
    }

    public function getErrors(): array
    {
        return $this->errors;
    }

    public function getToken()
    {
        return $this->csrfProvider->refreshToken(self::TOKEN_NAME);
    }

    public function addAssertion(string $fieldName, Constraint $assertion) {

        $this->assertions[$fieldName][] = $assertion;
    }

    public function isValid(Request $request): bool
    {
        if (!$this->isTokenValid($request)) {
            $this->addError('Sorry, something went wrong. Please refresh the page!');

            return false;
        }

        $isValid = true;
        $this->buildValidation();

        foreach($this->assertions as $filedName => $assertionGroup) {
            foreach($assertionGroup as $assertion) {
                $error = $this->validator->validateValue($request->get($filedName),$assertion);
                if (count($error) > 0) {
                    $isValid = false;
                    $this->addError($error->get(0)->getMessage());
                }
            }
        }

        return $isValid;
    }

    public function isTokenValid(Request $request): bool
    {
        if ($this->csrfProvider->isTokenValid(new CsrfToken(self::TOKEN_NAME, $request->get(self::TOKEN_NAME)))) {

            return true;
        }

        return false;
    }

    abstract protected function buildValidation();
}
