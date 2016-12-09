<?php
require_once 'vendor/autoload.php';

use Doctrine\ORM\ {
    Tools\Console\Helper\EntityManagerHelper,
    Tools\Console\Command
};

use Symfony\Component\Console\ {
    Application as CliApplication,
    Helper\HelperSet
};

use Doctrine\DBAL\ {
    Tools\Console\Helper\ConnectionHelper,
    Connection,
    Version
};

$app = require 'app/app.php';

$em = $app['em'];

$cli = new CliApplication('Doctrine Command Line Interface', Version::VERSION);
$cli->setCatchExceptions(true);

$cli->setHelperSet(new HelperSet([
    'db' => new ConnectionHelper($em->getConnection()),
    'em' => new EntityManagerHelper($em)
]));

$cli->addCommands([
    new Command\GenerateRepositoriesCommand,
    new Command\GenerateEntitiesCommand,
    new Command\ConvertMappingCommand,
    new Command\ValidateSchemaCommand,
    new Command\SchemaTool\CreateCommand,
    new Command\SchemaTool\UpdateCommand,
    new Command\GenerateProxiesCommand
]);

$cli->run();
