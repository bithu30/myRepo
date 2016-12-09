<?php
namespace App\Controller\Admin;

use App\Model\User;
use App\Password\HasherInterface;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\{
    JsonResponse,
    Request,
    Response
};
use App\Controller\Admin\Response\{
    AdminSuccessJson,
    AdminErrorJson
};
use Symfony\Component\Serializer\Normalizer\NormalizerInterface;

class AdminUsers
{
    private $twig;
    private $em;
    private $hasher;
    private $normalizer;

    public function __construct(
        \Twig_Environment $twig,
        EntityManagerInterface $em,
        HasherInterface $hasher,
        NormalizerInterface $normalizer
    ) {
        $this->twig = $twig;
        $this->em = $em;
        $this->hasher = $hasher;
        $this->normalizer = $normalizer;
    }

    public function indexAction(): Response
    {
        return new Response(
            $this->twig->render('admin/admin_users.html.twig')
        );
    }

    public function listAction(Request $request): JsonResponse
    {
        $start = $request->get('jtStartIndex');
        $max = $request->get('jtPageSize');
        $users = $this->em->createQuery('SELECT u.id, u.email, u.role FROM App\Model\User u')
            ->setFirstResult($start)
            ->setMaxResults($max)
            ->getArrayResult();

        return AdminSuccessJson::createResponse($users);
    }

    public function createAction(Request $request)
    {
        try {
            $user = new User();
            $this->setValueFromRequest($user, $request);
            $this->em->persist($user);
            $this->em->flush();

            return AdminSuccessJson::createResponse($this->normalizer->normalize($user));

        } catch (\Throwable $t) {

            return AdminErrorJson::createResponse($t->getMessage());
        }
    }

    public function updateAction(Request $request): JsonResponse
    {
        try {
            $user = $this->getUser($request->get('id'));
            $this->setValueFromRequest($user, $request);
            $this->em->flush();

            return AdminSuccessJson::createResponse($this->normalizer->normalize($user));
        } catch (\Throwable $t) {

            return AdminErrorJson::createResponse($t->getMessage());
        }
    }

    public function deleteAction(Request $request): JsonResponse
    {
        try {
            $user = $this->getUser($request->get('id'));
            $this->em->remove($user);
            $this->em->flush();

            return AdminSuccessJson::createResponse();
        } catch (\Throwable $t) {

            return AdminErrorJson::createResponse($t->getMessage());
        }
    }

    private function getUser(int $userId): User
    {
        return $this->em->getRepository('App\Model\User')->findOneById($userId);
    }

    private function setValueFromRequest(User $user, Request $request)
    {
        if (!empty($request->get('email'))) {
            $user->setEmail($request->get('email'));
        }
        if (!empty($request->get('password'))) {
            $user->setPassword($this->hasher->hashPassword($request->get('password')));
        }
        if (!empty($request->get('role'))) {
            $user->setRole($request->get('role'));
        }
    }
}