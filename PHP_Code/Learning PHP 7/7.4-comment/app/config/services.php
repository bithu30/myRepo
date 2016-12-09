<?php
use App\Controller;
use Symfony\Component\Security\Csrf\CsrfTokenManager;

$app['csrf_manager'] = function() {
    return new CsrfTokenManager();
};
$app['password_hasher'] = function() {
    return new App\Password\Hasher();
};
$app['user_session'] = function() use ($app) {
    return new App\Session\UserSession($app['session']);
};
$app['item_per_page'] = 5;

$app['homepage.controller'] = function() use ($app) {
    return new Controller\Homepage(
        $app['twig'],
        $app['monolog'],
        $app['em'],
        $app['item_per_page']
    );
};

$app['signup.form'] = function() use ($app) {
    return new App\Form\SignUpForm(
        $app['csrf_manager'],
        $app['validator']
    );
};

$app['signup.controller'] = function() use ($app) {
    return new Controller\SignUp(
        $app['twig'],
        $app['monolog'],
        $app['session'],
        $app['url_generator'],
        $app['em'],
        $app['password_hasher'],
        $app['signup.form']
    );
};

$app['login.form'] = function() use ($app) {
    return new App\Form\LoginForm(
        $app['csrf_manager'],
        $app['validator']
    );
};

$app['login.controller'] = function() use ($app) {
    return new Controller\Login(
        $app['twig'],
        $app['monolog'],
        $app['session'],
        $app['url_generator'],
        $app['em'],
        $app['password_hasher'],
        $app['login.form'],
        $app['user_session']
    );
};

$app['post.form'] = function() use ($app) {
    return new App\Form\PostForm(
        $app['csrf_manager'],
        $app['validator']
    );
};

$app['post.controller'] = function() use ($app) {
    return new Controller\UserPost(
        $app['twig'],
        $app['url_generator'],
        $app['em'],
        $app['user_session'],
        $app['post.form'],
        $app['monolog'],
        $app['upload_dir']
    );
};

$app['dashboard.controller'] = function() use ($app) {
    return new Controller\Dashboard(
        $app['twig'],
        $app['session'],
        $app['user_session'],
        $app['em']
    );
};

$app['comment.form'] = function() use ($app) {
    return new App\Form\CommentForm(
        $app['csrf_manager'],
        $app['validator']
    );
};

$app['comment.controller'] = function() use ($app) {
    return new Controller\PostComment(
        $app['twig'],
        $app['em'],
        $app['user_session'],
        $app['comment.form'],
        $app['monolog']
    );
};

$app['like.controller'] = function() use ($app) {
    return new Controller\PostLike(
        $app['twig'],
        $app['em'],
        $app['monolog'],
        $app['user_session']
    );
};

//admin services
$app['normalizer'] = new Symfony\Component\Serializer\Normalizer\ObjectNormalizer();

$app['admin_home.controller'] = function() use ($app) {
    return new Controller\Admin\AdminHome(
        $app['twig']
    );
};

$app['admin_users.controller'] = function() use ($app) {
    return new Controller\Admin\AdminUsers(
        $app['twig'],
        $app['em'],
        $app['password_hasher'],
        $app['normalizer']
    );
};

$app['admin_posts.controller'] = function() use ($app) {
    return new Controller\Admin\AdminPosts(
        $app['twig'],
        $app['em'],
        $app['normalizer'],
        $app['upload_dir']
    );
};

$app['admin_comments.controller'] = function() use ($app) {
    return new Controller\Admin\AdminComments(
        $app['twig'],
        $app['em']
    );
};