<?php
namespace App\Form;

use Symfony\Component\Validator\Constraints as Assert;

class CommentForm extends FormValidator
{
    protected function buildValidation()
    {
        $this->addAssertion('comment', new Assert\NotBlank(array('message' => 'The comment should not be blank')));
        $this->addAssertion('comment', new Assert\Length(
            array(
                'max'        => 250,
                'maxMessage' => 'The comment cannot be longer than {{ limit }} characters',
            )
        ));
    }
}
