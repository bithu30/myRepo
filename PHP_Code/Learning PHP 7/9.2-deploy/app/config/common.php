<?php
$app['twig.path'] = array(__DIR__.'/../../templates');
$app['twig.options'] = array('cache' => __DIR__.'/../cache/twig');
$app['image_path'] = '/images';
$app['upload_dir'] = __DIR__.'/../../web'.$app['image_path'];
