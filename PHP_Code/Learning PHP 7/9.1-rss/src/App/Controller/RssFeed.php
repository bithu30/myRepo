<?php
namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;

class RssFeed
{
    private $twig;
    private $em;
    private $feedToDisplay;

    public function __construct(
        \Twig_Environment $twig,
        EntityManagerInterface $em,
        int $feedToDisplay
    )
    {
        $this->twig = $twig;
        $this->em = $em;
        $this->feedToDisplay = $feedToDisplay;
    }

    public function indexAction(): Response
    {
        $posts = $this->getPosts();

        $rss = new \SimpleXMLElement('<?xml version="1.0" encoding="UTF-8" ?><rss version="2.0"></rss>');

        $channel = $rss->addChild('channel');
        $channel->addChild('title', 'My photo social network');
        $channel->addChild('description', 'A photo social network');
        $channel->addChild('link', 'http://mypublicdomain.com');

        foreach ($posts as $post) {
            $item = $channel->addChild('item');
            $item->addChild('title', htmlspecialchars($post->getTitle(), ENT_XML1, 'UTF-8'));
            $item->addChild('description',  htmlspecialchars($post->getDescription(), ENT_XML1, 'UTF-8'));
        }

        $response = new Response();
        $response->setStatusCode(200);
        $response->headers->set('Content-Type', 'text/xml; charset=ISO-8859-1');
        $response->setContent($rss->asXML());

        return $response;
    }

    private function getPosts() : array
    {
        return  $posts = $this->em->getRepository('App\Model\Post')->findBy(
            [],
            ['id'=> 'DESC'],
            $this->feedToDisplay
        );
    }
}
