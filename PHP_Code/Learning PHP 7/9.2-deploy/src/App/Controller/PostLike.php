<?php

namespace App\Controller;

use App\Traits\{
    FlashErrorTrait,
    TokenValidatorTrait
};
use App\Model\Like;
use App\Session\UserSessionInterface;
use Doctrine\ORM\EntityManagerInterface;
use Psr\Log\LoggerInterface;
use Symfony\Component\HttpFoundation\{
    Response,
    JsonResponse
};

class PostLike
{
    private $twig;
    private $em;
    private $log;
    private $userSession;

    public function __construct(
        \Twig_Environment $twig,
        EntityManagerInterface $em,
        LoggerInterface $log,
        UserSessionInterface $userSession
    )
    {
        $this->twig = $twig;
        $this->em = $em;
        $this->log = $log;
        $this->userSession = $userSession;
    }

    public function likeAction($postId): Response
    {
        $userFromSession = $this->userSession->getUser();
        $user = $this->em->find("App\Model\User", $userFromSession->getId());
        $post = $this->em->getRepository('App\Model\Post')->find($postId);
        if ($post->isLikedByUser($user)) {
            return new JsonResponse(['error' => 'preference already registered'], 400);
        }

        $like = new Like();
        $like->setUser($user);
        $like->setPost($post);
        $like->setPostedAt(new \DateTime('now'));
        $this->em->persist($like);
        $post->addLike($like);
        $this->em->persist($post);
        $this->em->flush();

        return new JsonResponse(['likes' => count($post->getLike())], 201);
    }

    public function unlikeAction($postId): Response
    {
        $userFromSession = $this->userSession->getUser();
        $user = $this->em->find("App\Model\User", $userFromSession->getId());
        $post = $this->em->getRepository('App\Model\Post')->find($postId);
        if (!$post->isLikedByUser($user)) {
            return new JsonResponse(['error' => 'preference already registered'], 400);
        }
        $userLike = $post->getLike()->filter(
            function($like) use ($user){
                return $like->getUser() == $user;
            }
        );
        $this->em->remove($userLike[0]);
        $this->em->flush();

        return new JsonResponse(['likes' => count($post->getLike())], 200);
    }
}