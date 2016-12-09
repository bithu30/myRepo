<?php
namespace App\Controller\Admin;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;

class AdminStats
{
    private $twig;
    private $em;

    public function __construct(
        \Twig_Environment $twig,
        EntityManagerInterface $em
    )
    {
        $this->twig = $twig;
        $this->em = $em;
    }

    public function indexAction(): Response
    {
        $visits = $this->getVisit();
        $actions = $this->getActions();

        return new Response(
            $this->twig->render('admin/admin_stat.html.twig',
                [
                    'visits' => $visits,
                    'actions' => $actions
                ]
            )
        );
    }

    private function getVisit(): array
    {
        $qb = $this->em->createQueryBuilder();

        $qb->select('v.date, count(v.id) as visits')
            ->from('App\Model\Visit', 'v')
            ->groupBy('v.date')
            ->add('orderBy', 'v.date ASC')
            ->setFirstResult(0)
            ->setMaxResults(10);
        $query = $qb->getQuery();

        return $query->getScalarResult();
    }

    private function getActions(): array
    {
        $actions = [];
        $qb = $this->em->createQueryBuilder()
            ->select('count(p.id)')
            ->from('App\Model\Post', 'p');
        $actions['posts'] = $qb->getQuery()->getSingleScalarResult();

        $qb = $this->em->createQueryBuilder()
            ->select('count(c.id)')
            ->from('App\Model\Comment', 'c');
        $actions['comments'] = $qb->getQuery()->getSingleScalarResult();

        $qb = $this->em->createQueryBuilder()
            ->select('count(l.id)')
            ->from('App\Model\Like', 'l');
        $actions['likes'] = $qb->getQuery()->getSingleScalarResult();

        $qb = $this->em->createQueryBuilder()
            ->select('count(u.id)')
            ->from('App\Model\User', 'u');
        $actions['users'] = $qb->getQuery()->getSingleScalarResult();

        return $actions;
    }
}
