<?php
namespace App\Controller\Admin;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Serializer\Normalizer\NormalizerInterface;
use Symfony\Component\HttpFoundation\{
    JsonResponse,
    Request,
    Response
};
use App\Controller\Admin\Response\{
    AdminSuccessJson,
    AdminErrorJson
};

class AdminComments
{
    private $twig;
    private $em;

    public function __construct(
        \Twig_Environment $twig,
        EntityManagerInterface $em
    ) {
        $this->twig = $twig;
        $this->em = $em;
    }

    public function listAction(Request $request): JsonResponse
    {
        $postId = $request->get('id');
        $comments = $users = $this->em->createQuery('SELECT c FROM App\Model\Comment c WHERE c.post = :post_id')
            ->setParameter('post_id', $postId)
            ->getArrayResult();

        return AdminSuccessJson::createResponse($comments);
    }

    public function deleteAction(Request $request): JsonResponse
    {
        try {
            $comentId = $request->get('id');
            $this->em->createQuery('DELETE FROM App\Model\Comment c WHERE c.id = :id')
                ->setParameter('id', $comentId)->execute();
            $post = $this->em->getRepository('App\Model\Post')->findOneById($request->get('postId'));
            $post->setCommentsNum($post->getCommentsNum() -1);
            $this->em->persist($post);
            $this->em->flush();

            return AdminSuccessJson::createResponse();
        } catch (\Throwable $t) {

            return AdminErrorJson::createResponse($t->getMessage());
        }
    }
}