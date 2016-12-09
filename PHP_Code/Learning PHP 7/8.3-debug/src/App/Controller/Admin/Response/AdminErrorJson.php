<?php
namespace App\Controller\Admin\Response;

use Symfony\Component\HttpFoundation\JsonResponse;

class AdminErrorJson implements AdminResponseInterface
{
    public static function createResponse($message = null): JsonResponse
    {
        $adminResponse = ['Result' => 'ERROR'];
        if ($message != null) {
            $adminResponse['Message'] = $message;
        }

        return new JsonResponse($adminResponse);
    }
}