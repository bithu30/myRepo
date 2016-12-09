<?php
use App\Controller;

$controllerPath = '../src/Controller/';

$app['homepage.controller'] = function() use ($app) {
    return new Controller\Homepage($app['twig'], $app['monolog']);
};

$app->get('/', "homepage.controller:indexAction");
