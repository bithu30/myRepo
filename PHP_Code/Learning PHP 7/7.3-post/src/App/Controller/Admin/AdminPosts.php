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

class AdminPosts
{
    private $twig;
    private $em;
    private $normalizer;
    private $uploadDir;

    public function __construct(
        \Twig_Environment $twig,
        EntityManagerInterface $em,
        NormalizerInterface $normalizer,
        $uploadDir
    ) {
        $this->twig = $twig;
        $this->em = $em;
        $this->normalizer = $normalizer;
        $this->uploadDir = $uploadDir;
    }

    public function indexAction(): Response
    {
        return new Response(
            $this->twig->render('admin/admin_posts.html.twig')
        );
    }

    public function listAction(Request $request): JsonResponse
    {
        $start = $request->get('jtStartIndex');
        $max = $request->get('jtPageSize');
        $posts = $this->em->createQuery('
            SELECT p, u
            FROM App\Model\Post p
            LEFT JOIN p.user u WHERE u.id = p.user')
            ->setFirstResult($start)
            ->setMaxResults($max)
            ->getArrayResult();

        return AdminSuccessJson::createResponse($posts);
    }

    public function deleteAction(Request $request): JsonResponse
    {
        try {
            $postId = $request->get('id');
            $post = $this->em->getRepository('App\Model\Post')->findOneById($postId);
            if ($post->getImage()) {
                $imageFile = $this->uploadDir.'/'.$post->getImage();
                unlink($imageFile);
            }
            $this->em->remove($post);
            $this->em->flush();

            return AdminSuccessJson::createResponse();
        } catch (\Throwable $t) {

            return AdminErrorJson::createResponse($t->getMessage());
        }
    }
}