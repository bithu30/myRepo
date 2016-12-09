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

$app->get('/admin/users', "admin_users.controller:indexAction")->bind('admin_users')->before($adminAuth);
$app->post('/admin/users/list', "admin_users.controller:listAction")->bind('admin_user_list')->before($adminAuth);
$app->post('/admin/users/create', "admin_users.controller:createAction")->bind('admin_user_create')->before($adminAuth);
$app->post('/admin/users/update', "admin_users.controller:updateAction")->bind('admin_user_update')->before($adminAuth);
$app->post('/admin/users/delete', "admin_users.controller:deleteAction")->bind('admin_user_delete')->before($adminAuth);

$app->get('/admin/posts', "admin_posts.controller:indexAction")->bind('admin_posts')->before($adminAuth);
$app->post('/admin/posts/list', "admin_posts.controller:listAction")->bind('admin_post_list')->before($adminAuth);
$app->post('/admin/posts/delete', "admin_posts.controller:deleteAction")->bind('admin_post_delete')->before($adminAuth);
