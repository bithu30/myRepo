<?php
// dev environment configuration
require __DIR__.'/common.php';

use Silex\Provider\WebProfilerServiceProvider;
use Silex\Provider\MonologServiceProvider;

// include the prod configuration


// enable the debug mode
$app['debug'] = true;

$app->register(new WebProfilerServiceProvider(), array(
    'profiler.cache_dir' => __DIR__.'/../cache/profiler',
));

$app->register(new MonologServiceProvider(), array(
    'monolog.logfile' => __DIR__.'/../logs/silex_dev.log',
    'monolog.level' => 'debug'
));