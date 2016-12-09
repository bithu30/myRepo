<?php
namespace App\Form;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraint;

interface FormValidatorInterface
{
    public function addError(string $error);
    public function getErrors(): array;
    public function getToken();
    public function addAssertion(string $fieldName, Constraint $assertion);
    public function isValid(Request $request): bool;
    public function isTokenValid(Request $request): bool;
}