<?php
use App\Controller;
use Symfony\Component\Security\Csrf\CsrfTokenManager;

$controllerPath = '../src/Controller/';

$app['csrf_manager'] = function() {
    return new CsrfTokenManager();
};
$app['password_hasher'] = function() {
    return new App\Password\Hasher();
};

$app['homepage.controller'] = function() use ($app) {
    return new Controller\Homepage($app['twig'], $app['monolog']);
};

$app['signup.controller'] = function() use ($app) {
    return new Controller\SignUp(
        $app['twig'],
        $app['monolog'],
        $app['csrf_manager'],
        $app['session'],
        $app['url_generator'],
        $app['validator'],
        $app['em'],
        $app['password_hasher']
    );
};

$app->get('/', "homepage.controller:indexAction")->bind('home');
$app->get('/signup', "signup.controller:showFormAction")->bind('signup');
$app->post('/signup/registration', "signup.controller:userRegistrationAction")->bind('registration');


