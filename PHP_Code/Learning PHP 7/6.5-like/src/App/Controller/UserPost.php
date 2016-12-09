<?php

namespace App\Controller;

use App\Form\FormValidatorInterface;
use App\Form\PostForm;
use App\Model\Post;
use App\Session\UserSessionInterface;
use Psr\Log\LoggerInterface;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\HttpFoundation\{
    Request,
    Response,
    RedirectResponse,
    JsonResponse,
    Session\SessionInterface
};
use Doctrine\ORM\EntityManagerInterface;


class UserPost
{
    private $twig;
    private $urlGenerator;
    private $em;
    private $userSession;
    private $form;
    private $log;
    private $uploadDir;

    public function __construct(
        \Twig_Environment $twig,
        UrlGeneratorInterface $urlGenerator,
        EntityManagerInterface $em,
        UserSessionInterface $userSession,
        FormValidatorInterface $form,
        LoggerInterface $log,
        $uploadDir
    )
    {
        $this->twig = $twig;
        $this->urlGenerator = $urlGenerator;
        $this->em = $em;
        $this->userSession = $userSession;
        $this->log = $log;
        $this->form = $form;
        $this->uploadDir = $uploadDir;
    }

    public function submitPostAction(Request $request): Response
    {
        if ($this->form->isValid($request)) {
            $post = $this->savePost($request);

            return new Response (
                $this->twig->render(
                    'post.html.twig',
                    ['post' => $post]
                ), 201
            );
        }

        return new Response(implode('<BR/>',$this->form->getErrors()), 400);
    }

    public function uploadImageAction(Request $request): Response
    {
        $image = $request->files->get('image');
        $filename = sha1(uniqid(mt_rand(), true)) . time();
        $filePath =  $filename . '.' . $image->guessExtension();

        if ('png' == $image->guessExtension()) {
            $imageSrc = imagecreatefrompng($image->getRealPath());
        } else {
            $imageSrc = imagecreatefromjpeg($image->getRealPath());
        }
        $imageScaled = imagescale($imageSrc, 800);
        imagejpeg($imageScaled, $this->uploadDir.'/temp/'.$filePath);

        $this->log->debug(sprintf('%s: image created %s',__CLASS__, $filePath));

        return new JsonResponse(['image' => $filePath], 201);
    }

    private function savePost($request): Post
    {
        $post = new Post();
        $user = $this->userSession->getUser();
        $user = $this->em->find("App\Model\User", $user->getId());
        $post->setUser($user);
        $post->setTitle($request->get('title'));
        $post->setDescription($request->get('description'));
        if ($imageName = $request->get('imageName')) {
            rename($this->uploadDir.'/temp/'.$imageName, $this->uploadDir.'/'.$imageName);
            $post->setImage($imageName);
        }
        $post->setPostedAt(new \DateTime('now'));
        $this->em->persist($post);
        $this->em->flush();

        return $post;
    }
}
