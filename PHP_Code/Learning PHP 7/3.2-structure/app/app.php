<?php

use Silex\Application;
use Silex\Provider\{
    TwigServiceProvider,
    ServiceControllerServiceProvider,
    HttpFragmentServiceProvider,
    UrlGeneratorServiceProvider
};
 
$app = new Application();
$app->register(new ServiceControllerServiceProvider());
$app->register(new TwigServiceProvider());
$app->register(new HttpFragmentServiceProvider());
$app->register(new UrlGeneratorServiceProvider());

return $app;
