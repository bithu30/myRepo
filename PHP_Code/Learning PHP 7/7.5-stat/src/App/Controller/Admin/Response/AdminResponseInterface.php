<?php
namespace App\Controller\Admin\Response;

use Symfony\Component\HttpFoundation\JsonResponse;

interface AdminResponseInterface
{
    public static function createResponse(): JsonResponse;
}