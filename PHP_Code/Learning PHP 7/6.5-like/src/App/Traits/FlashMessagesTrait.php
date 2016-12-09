<?php
namespace App\Traits;

trait FlashMessagesTrait
{
    public function setFlashMessages(string $name, array $messages)
    {
        foreach ($messages as $message) {
            $this->session->getBag('flashes')->add($name, $message);
        }
    }
}