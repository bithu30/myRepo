<?php

use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;

$controllerPath = '../src/Controller/';

require 'services.php';

// firewall
$userAuth = function (Request $request, Silex\Application $app) {
    if(!$app['user_session']->hasRole(\App\Model\UserRole::ROLE_USER) &&
       !$app['user_session']->hasRole(\App\Model\UserRole::ROLE_ADMIN)
    ) {
        return new RedirectResponse(
            $app['url_generator']->generate('login')
        );
    }
};

$app->get('/', "homepage.controller:indexAction")->bind('home')->before($userAuth);
$app->get('/next-page/{page}', "homepage.controller:nextPageAction")->value('page', 2)->bind('next_home_page')->before($userAuth);

$app->get('/signup', "signup.controller:showFormAction")->bind('signup');
$app->post('/signup/registration', "signup.controller:userRegistrationAction")->bind('registration');

$app->get('/login', "login.controller:showFormAction")->bind('login');
$app->post('/login', "login.controller:loginCheckAction")->bind('login_check');
$app->get('/logout', "login.controller:logoutAction")->bind('logout');

$app->post('/post', "post.controller:submitPostAction")->bind('submit_post')->before($userAuth);
$app->get('/my-posts', "dashboard.controller:indexAction")->bind('dashboard')->before($userAuth);
$app->post('/post/upload', "post.controller:uploadImageAction")->bind('upload_image')->before($userAuth);

$app->get('/comments/post/{postId}', "comment.controller:getCommentsAction")->bind('get_comments')->before($userAuth);
$app->post('/comment', "comment.controller:postCommentAction")->bind('post_comment')->before($userAuth);

$app->post('/like/post/{postId}', "like.controller:likeAction")->bind('like_post')->before($userAuth);
$app->delete('/like/post/{postId}', "like.controller:unlikeAction")->bind('unlike_post')->before($userAuth);


// admin firewall
$adminAuth = function (Request $request, Silex\Application $app) {
    if(!$app['user_session']->hasRole(\App\Model\UserRole::ROLE_ADMIN)) {
        return new RedirectResponse(
            $app['url_generator']->generate('login')
        );
    }

};

$app->get('/admin', "admin_home.controller:indexAction")->before($adminAuth);
