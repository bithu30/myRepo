<?php
use App\Model\User;

$testUser = $app['em']->getRepository('App\Model\User')->findOneByEmail('test@test.com');
$app['user_session']->setUser($testUser);
