<?php
namespace App\Controller\Admin\Response;

use Symfony\Component\HttpFoundation\JsonResponse;

class AdminSuccessJson implements AdminResponseInterface
{
    public static function createResponse($record = null): JsonResponse
    {
        $adminResponse = ['Result' => 'OK'];
        if ($record != null) {
            $key = 'Records';
            if (count($record) == count($record, COUNT_RECURSIVE))
            {
                $key = 'Record';
            }
            $adminResponse['TotalRecordCount'] = count($record);
            $adminResponse[$key] = $record;
        }

        return new JsonResponse($adminResponse);
    }
}
