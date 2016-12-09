<?php
require 'config/database.php';

use Silex\Application;
use Silex\Provider\{
    TwigServiceProvider,
    ServiceControllerServiceProvider,
    HttpFragmentServiceProvider,
    UrlGeneratorServiceProvider,
    DoctrineServiceProvider,
    SessionServiceProvider,
    ValidatorServiceProvider
};
use Doctrine\ORM\{
    Tools\Setup,
    EntityManager
};

$app = new Application();
$app->register(new ServiceControllerServiceProvider());
$app->register(new TwigServiceProvider());
$app->register(new HttpFragmentServiceProvider());
$app->register(new UrlGeneratorServiceProvider());
$app->register(new DoctrineServiceProvider(), array(
    "db.options" => $dbConnection
));
$app->register(new SessionServiceProvider());
$app->register(new ValidatorServiceProvider());

$paths = array(__DIR__."/../src/App/Model");
$isDevMode = false;
$config = Setup::createYAMLMetadataConfiguration($paths, $isDevMode, __DIR__.'/cache/');
$config->setAutoGenerateProxyClasses(true);

$app['em'] = EntityManager::create($dbConnection, $config);


return $app;
