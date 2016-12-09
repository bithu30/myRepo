<?php

namespace App\Controller;

use App\Form\FormValidatorInterface;
use App\Model\Comment;
use App\Session\UserSessionInterface;
use Psr\Log\LoggerInterface;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\HttpFoundation\{
    Request,
    Response,
    RedirectResponse,
    JsonResponse
};
use Doctrine\ORM\EntityManagerInterface;


class PostComment
{
    private $twig;
    private $em;
    private $userSession;
    private $form;
    private $log;

    public function __construct(
        \Twig_Environment $twig,
        EntityManagerInterface $em,
        UserSessionInterface $userSession,
        FormValidatorInterface $form,
        LoggerInterface $log
    )
    {
        $this->twig = $twig;
        $this->em = $em;
        $this->userSession = $userSession;
        $this->form = $form;
        $this->log = $log;
    }

    public function getCommentsAction($postId): Response
    {
        $comments = $this->em->getRepository('App\Model\Comment')
            ->findByPost(
                $postId,
                ['id'=> 'DESC']
            );

        return new Response(
            $this->twig->render('comments.html.twig',
                array(
                    'comments' => $comments
                )
            )
        );
    }

    public function postCommentAction(Request $request): Response
    {
        if ($this->form->isValid($request)) {
                $comment = $this->saveComment($request);

                return new Response (
                    $this->twig->render('single_comment.html.twig',
                        ['comment' => $comment]),
                    201
                );
        }
        $errors = $this->form->getErrors();

        return new Response(implode(',', $errors), 400);
    }

    private function saveComment($request)
    {
        $comment = new Comment();
        $user = $this->userSession->getUser();
        $user = $this->em->find("App\Model\User", $user->getId());
        $comment->setUser($user);
        $comment->setComment($request->get('comment'));
        $post = $this->em->find("App\Model\Post", $request->get('postId'));
        $post->setCommentsNum($post->getCommentsNum()+1);
        $comment->setPost($post);
        $comment->setPostedAt(new \DateTime('now'));
        $this->em->persist($comment);
        $this->em->flush();

        return $comment;
    }
}