<?php
namespace App\Form;

use Symfony\Component\Validator\Constraints as Assert;

class PostForm extends FormValidator
{
    protected function buildValidation()
    {
        $this->addAssertion('title', new Assert\NotBlank(array('message' => 'The title should not be blank')));
        $this->addAssertion('title', new Assert\Length(
            [
                'max'        => 150,
                'maxMessage' => 'The title cannot be longer than {{ limit }} characters',
            ]
        ));
        $this->addAssertion('description', new Assert\Length(
            [
                'max'        => 250,
                'maxMessage' => 'The desciption cannot be longer than {{ limit }} characters',
            ]
        ));
    }
}
