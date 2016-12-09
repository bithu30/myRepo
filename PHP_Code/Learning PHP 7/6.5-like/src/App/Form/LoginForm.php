<?php
namespace App\Form;

use Symfony\Component\Validator\Constraints as Assert;

class LoginForm extends FormValidator
{
    protected function buildValidation()
    {
        $this->addAssertion('email', new Assert\NotBlank(array('message' => 'The email should not be blank')));
        $this->addAssertion('email', new Assert\Email(array('message' => 'Please provide a valid email address')));
        $this->addAssertion('password', new Assert\NotBlank(array('message' => 'The password should not be blank')));
    }
}
