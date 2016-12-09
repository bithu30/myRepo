<?php
use App\Model\User;
use App\Session\UserSession;

$testUser = $app['em']->getRepository('App\Model\User')->findOneByEmail('nicola@test.com');
$app['session']->set(UserSession::SESSION_TOKEN, serialize($testUser));
